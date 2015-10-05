class UserMailer < ApplicationMailer
  def new_article(article)
    @article = article
    mail(subject: "#{@article.title}")
  end
end
