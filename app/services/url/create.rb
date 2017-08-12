class Url::Create < ServiceObject

  def initialize original
    @original = original
  end

  def call
    if check_exists? @original
      @url = Url.where(original: @original).first
    else
      @url = Url.new(original: @original)
      @url.save
    end
    @result = result @url
  end

  private

  def check_exists? original
    Url.where(original: original).exists?
  end
end
