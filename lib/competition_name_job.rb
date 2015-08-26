class CompetitionNameJob < Struct.new(:link, :user_id)
  
  require 'nokogiri'
  require 'open-uri'
  
  def perform
    Delayed::Worker.logger.debug("job start")
    sub_s = link["https://www.kaggle.com".length..-1]
    xpath = "string(//div[contains(@id, 'comp-header-details')]/descendant::a[contains(@href, '#{sub_s}')][2])"
    html_content = Nokogiri::HTML(open(link))
    @competition_name = html_content.xpath(xpath)
  end

  def success
    Delayed::Worker.logger.debug(user_id)
    Challenge.where(:user_id => user_id).update_all(name: @competition_name)
  end
end
