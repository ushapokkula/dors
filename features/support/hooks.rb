at_exit do
  ReportBuilder.configure do |config|
    config.json_path = 'reports'
    config.report_path = 'report'
    config.report_types = [:html]
    config.report_tabs = [:overview, :features, :scenarios, :errors]
    config.report_title = 'Test Results'
    config.compress_images = false
  end
  ReportBuilder.build_report
end


Before do
  page.driver.browser.manage.window.maximize
  @trainers=Trainers.new
end

# After do
#   page.execute_script("window.localStorage.clear()")
# end


After ('~@nologout') do
  find('#btn-signout').click
end

# Takes screenshot after scenario failure and then click logout link
After ('~@nologout') do |scenario|
   if (scenario.failed?)
  Dir.mkdir("images") unless File.directory?("images")
  image_name = "images/#{scenario.__id__}.png"
  save_screenshot(image_name, :full => true)
  embed(image_name, "image/png", "SCREENSHOT")
  find('#btn-signout').click
   end
end

# After ('~@nologout') do |scenario|
#    if (scenario.failed?)
#      find('#btn-signout').click
#    end
# end

#delete the images files before every test
unless Dir.glob('images/*').empty?
  FileUtils.rm_rf Dir.glob('images/*')
end
#delete the error reports generated for failures
unless Dir.glob('error_pages/*').empty?
  FileUtils.rm_rf Dir.glob('error_pages/*')
end

#delete the json reports generated
unless Dir.glob('reports/*').empty?
  FileUtils.rm_rf Dir.glob('reports/*')
end

#delete the junit reports generated
unless Dir.glob('junit/*').empty?
  FileUtils.rm_rf Dir.glob('junit/*')
end

#create reports directory if not present
Dir.mkdir("reports") unless File.directory?("reports")

