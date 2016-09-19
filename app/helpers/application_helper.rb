module ApplicationHelper
  def format_link(url)
    url.sub(/^https?\:\/\//, '').sub(/^www./,'')
  end

  def fix_url(url)
    url.start_with?('http://', 'https://') ? url : "http://#{url}"
  end

  def star_rating(rating)
    if rating.nil?
      'No reviews yet'
    else
      rounded = rating.round
      stars = '<span class="glyphicon glyphicon-star"></span>' * rounded
      blanks = '<span class="glyphicon glyphicon-star-empty"></span>' * (5 - rounded)
      (stars + blanks).html_safe
    end
  end

  def format_date(dt)
    dt.strftime("%m/%d/%Y %l:%M%P %Z")
  end
end
