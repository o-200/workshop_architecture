# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :import do
  desc "Import books from PostgreSQL to MongoDB"
  task books: :environment do
    puts "Начинаем импорт статей..."

    Book.find_each do |article|
      p article.title
      BookDocument.create_with!(article.attributes)
    rescue StandardError => e
      puts "Ошибка при импорте статьи #{article.id}: #{e.message}"
    end

    puts "Импорт завершен!"
  end
end
