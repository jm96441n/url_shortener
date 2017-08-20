class Url::Create < ServiceObject

  def initialize original
    @original = original
  end

  def call
    if check_exists? @original
      @url = Url.where(original: @original).first
      @url.request_count += 1
    else
      @url = Url.new(original: @original)
    end
    @url.save

    @result = get_result @url
  end

  private

  def check_exists? original
    Url.where(original: original).exists?
  end
end
