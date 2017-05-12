class Commit

  attr_reader :message

  def initialize(message)
    @message = message
  end

  def self.find_commits(token, login)
    raw_events = GithubService.commits(token, login)
    push_events = raw_events.select { |event| event[:type] == "PushEvent" }
    repos = push_events.map { |event| (event[:repo][:name]).split('/').pop }

    commits = push_events.map.with_index do |event, n|
      raw_commits = event[:payload][:commits]
      raw_commits.map do |raw_commit|
        [repos[n], (raw_commit[:message]).sub(/\n\n/, '>').split('>').shift]
      end
    end.flatten(1)

    create_commits(commits)
  end

  def self.create_commits(commits)
    commits.map { |commit| commit.join(': ') }.map { |commit| new(commit) }
  end

end
