desc "Fetch the competition name by scraping"
task :fetch_comp_name => :environment do
  require 'open-uri'
  require 'nokogiri'

  url = 'https://www.kaggle.com/c/titanic'
  html_content = Nokogiri::HTML(open(url))
  html_content.xpath("string(//div[contains(@id, 'comp-header-details')]/descendant::a[contains(@href, '#{challenge_substring}')][2])")
end