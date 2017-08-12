class Result
  def initialize model
    @model    = model
    @errors   = @model.errors
  end

  def success?
    @model.errors.empty?
  end
end
