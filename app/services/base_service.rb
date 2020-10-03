class BaseService
  include ServiceCallable

  def call
    raise NotImplementedError, 'Method #call must be defined.'
  end
end