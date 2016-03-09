require_relative './luhn_validator.rb'
require 'json'
require 'openssl'

class CreditCard
  # mixin the LuhnValidator using an 'include' statement
  include LuhnValidator
  # instance variables with automatic getter/setter methods
  attr_accessor :number, :expiration_date, :owner, :credit_network

  def initialize(number, expiration_date, owner, credit_network)
    # initialize the instance variables listed above (do not forget the '@')
    @number = number
    @expiration_date = expiration_date
    @owner = owner
    @credit_network = credit_network
  end

  # returns json string
  def to_json
    {
      number: @number,
      expiration_date: @expiration_date,
      owner: @owner,
      credit_network: @credit_network }.to_json
  end

  # returns all card information as single string
  def to_s
    to_json
  end

  # return a new CreditCard object given a serialized (JSON) representation
  def self.from_s(card_s)
    card_json = JSON.load(card_s)
    CreditCard.new(card_json['number'],
                   card_json['expiration_date'],
                   card_json['owner'],
                   card_json['credit_network'])
  end

  # return a hash of the serialized credit card object
  def hash
    # TODO: Produce a hash (using default hash method) of the credit card's
    #       serialized contents.
    #       Credit cards with identical information should produce the same hash.
  end

  # return a cryptographically secure hash
  def hash_secure
    # TODO: Use sha256 from openssl to create a cryptographically secure hash.
    #       Credit cards with identical information should produce the same hash.
  end
end
