class StatsController < ApplicationController
  def rated
    @systems = Sig.where(:type_id => [ 26, 14, 21, 27, 30, 33, 41 ]).group(:system_id).count
    @systems = @systems.sort_by { |system_id, sigs| sigs }.reverse
  end
  def all
    @systems = Sig.group(:system_id).count
    @systems = @systems.sort_by { |system_id, sigs| sigs }.reverse
  end
end
