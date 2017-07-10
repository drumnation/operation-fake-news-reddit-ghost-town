def vote_generator
    1000.times do |vote|
        s_id = Submission.all.collect {|submission| submission.id}.sample
        u_id = User.all.collect {|user| user.id }.sample
        rand_vote = [1, -1].sample
        vote = Vote.new(user_id: u_id, submission_id: s_id, upvote: rand_vote)
        vote.save
    end
end

vote_generator
