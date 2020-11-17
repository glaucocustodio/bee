require 'active_support'
require 'active_support/core_ext'

CACHE = ActiveSupport::Cache::MemoryStore.new

class PasswordChecker
  attr_reader :password

  def initialize(password)
    @password = password
  end

  def status
    if strong_password?
      'strong'
    elsif ok_password?
      'ok'
    else
      'weak'
    end
  end

  private

  def strong_password?
    valid_length? && valid_case? && has_number? && has_symbol? && has_not_sequence? && not_blacklisted?
  end

  def ok_password?
    valid_length? && valid_case? && has_number?
  end

  def valid_length?
    password.length >= 6
  end

  def valid_case?
    /[[:upper:]]/.match(password) && /[[:lower:]]/.match(password)
  end

  def has_number?
    /\d/.match(password)
  end

  def has_symbol?
    /[@#\$%]/.match(password)
  end

  def has_not_sequence?
    !(password =~ /(.)\1/)
  end

  def not_blacklisted?
    !blacklist.include?(password)
  end

  def blacklist
    CACHE.fetch(:password_blacklist) do
      File.readlines('password_blacklist.txt').map { _1.delete("\n") }
    end
  end
end
