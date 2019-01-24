Before do |scenario|
  Capybara.current_session.driver.browser.manage.delete_all_cookies
  Capybara.default_max_wait_time = 10
end

After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/, "_").tr("/", "_")
  ambiente = CONFIG["url_default"]

  if scenario.failed?
    save_screenshot("#{scenario_name.downcase!}", "Error")
  else
    save_screenshot("#{scenario_name.downcase!}", "Passed")
  end
end
