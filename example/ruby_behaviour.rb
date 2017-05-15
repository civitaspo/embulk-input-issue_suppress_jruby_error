class Error1 < ::StandardError; end
class Error2 < ::StandardError; end
class Error3 < ::StandardError; end


def err1
  raise Error1, "err"
end

def err2
  begin
    err1
  rescue Error1 => e
    raise Error2, e
  end
end

def err3
  begin
    err2
  rescue Error2 => e
    raise Error3, e
  end
end

begin
  err3
rescue => e
  puts "e: {class:#{e.class},msg:#{e}}"
  puts "e.cause: {class:#{e.cause.class},msg:#{e.cause}}"
  puts "e.cause.cause: {class:#{e.cause.cause.class},msg:#{e.cause.cause}}"
end
