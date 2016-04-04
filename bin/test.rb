require 'watir-webdriver'
require 'headless'

currentTime = Time.now.strftime('%s')

headless = Headless.new
headless.start

browser = Watir::Browser.new
browser.window.resize_to(1024,900)

#searches = ['Watir','Watir Development Builds', 'Watir Performance Testing', 'Watir New Process', 'ruby-debug']

browser.goto("#{ARGV[0]}")

=begin
searches.each do |search|
        browser.text_field(:name => 'q').set search
        browser.button(:name => 'btnG').click
end
=end

browser.screenshot.save("/opt/mitch/#{currentTime}.png")

browser.close
headless.destroy
