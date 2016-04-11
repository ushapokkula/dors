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

After do
  page.execute_script("window.localStorage.clear()")
end
=begin
After do
  find('#btn-signout').click
end
=end


After do |scenario|
  # if (scenario.failed?)
  Dir.mkdir("images") unless File.directory?("images")
  image_name = "images/#{scenario.__id__}.png"
  save_screenshot(image_name, :full => true)
  embed(image_name, "image/png", "SCREENSHOT")
  # end
end


#delete the images files before every test
unless Dir.glob('images/*').empty?
  FileUtils.rm_rf Dir.glob('images/*')
end

#create reports directory if not present
# Dir.mkdir("reports") unless File.directory?("reports")

After do |scenario|
  if (scenario.failed?)
    scenario_name = scenario.name.gsub /[^\w\-]/, ' '
    time = Time.now.strftime("%Y-%m-%d-%H%M")
    filename = time + '_' + scenario_name
    Dir.mkdir("error_pages") unless File.directory?("error_pages")
    save_and_open_page("error_pages/#{filename}")
    # File.open("error_pages/#{filename}.html", 'w') { |f| f.write(page.html) }
  end
end