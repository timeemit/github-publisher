require 'octokit'

class Uploader
  @@token = ENV['AUTH_TOKEN']
  @@username = ENV['AUTH_USER']
  @@password = ENV['AUTH_PASS']
  @@repo = ENV['REPO']

  if not @@token and not (@@username and @@password)
    p 'No authentication detected'
    exit(1)
  end

  def self.upload(path, body)
    client = Octokit::Client.new(@@token ? {access_token: @@token} : {login: @@username, password: @@password})

    # Read Existing
    branch = client.branch(@@repo, 'master')
    base_tree = client.tree(@@repo, branch.commit.commit.tree.sha)

    # Write blob
    sha = client.create_blob(@@repo, body)

    # Write tree
    tree = client.create_tree(@@repo, [{path: path, mode: '100644', type: 'blob', sha: sha}], {base_tree: base_tree.sha})

    # Write commit
    commit = client.create_commit(@@repo, 'Automatically Published', tree.sha, branch.commit.sha)

    # Update branch
    client.update_ref(@@repo, 'heads/master', commit.sha, false)
  end
end
