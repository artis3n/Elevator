require 'set'

class Building

  attr_reader :elevators, :floors, :pickup_requests
  attr_accessor :floors # only for testing TODO: remove when done

  def initialize
    @floors = Hash.new
    @elevators = Array.new
    @pickup_requests = Set.new
  end

  def build_floors(params)
    @floors = params[:floors]
  end

  def build_elevators(params)
    @elevators = params[:elevators]
  end

  def number_of_elevators
    elevators.nil? ? raise(Exception,'No elevators exist! You should run the Building#build_elevators method.') :
        elevators.count
  end

  def number_of_floors
    floors.nil? ? raise(Exception, 'No floors exist! You should run the Building#build_floors method.') : floors.keys
                                                                                                            .count
  end

  def start_turn
    elevators.each { |elevator| elevator.start_turn }

    sleep 1
    to_s
  end

  # Returns floor object corresponding to floor number
  def floor(num)
    floors[num]
  end

  # Adds a pickup request to the Set of requests
  def log_pickup_request(floor_num)
    @pickup_requests.add floor_num
  end

  # Returns an array of all current pickup requests
  def get_all_pickup_requests
    pickup_requests.to_a
  end

  # Returns a boolean referring to whether there are pickup requests ABOVE the floor_num
  def check_pickup_requests(floor_num)

    nums = Array.new
    total_floors = floors.keys.count

    ((floor_num + 1)..total_floors).each do |floor|
        return true if pickup_requests.include? floor
    end

    false

  end

  def to_s
    #TODO: This
  end

end