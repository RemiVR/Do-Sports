require 'faye'
 
bayeux = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
rub bayeux