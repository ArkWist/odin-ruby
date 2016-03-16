class Arg
  def initialize(arg, arg_name)
    @arg, @arg_name = arg, arg_name
  end

  def ==(other_arg)
    #same = if @arg == other_arg then true else false end
    same = @arg == other_arg ? true : false
  end

end
