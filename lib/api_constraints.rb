class ApiConstraints

  #extract the options defined in routes.eb into instance vars
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  #checks if the default version is included in the accept header
  def matches?(req)
    @default || req.headers['Accept'].include?("#{@version}")
  end
end
