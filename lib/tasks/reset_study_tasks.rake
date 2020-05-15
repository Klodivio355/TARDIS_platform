namespace :db do
  desc "Sequentially clears out the models I don't care about"
  task :reset_study_tasks => :environment do
    puts "Clearing out the BlahModel model"
    StudyTask.destroy_all
    puts "Finished."
  end
end