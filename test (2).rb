
passenger_wagon1 = PassengerWagon.new(22, 'sts', 111)
train_passenger1 = PassengerTrain.new(12250, :passenger, 565)
train_passenger1 .add_wagon(passenger_wagon1)
passenger_wagon1.take_space
passenger_wagon1.free_space
passenger_wagon1.occupied_space


train_cargo1 = CargoTrain.new(24812, :cargo, 45)
train_passenger1 = PassengerTrain.new(12250, :passenger, 565)
train_1 = Train.new(2122, :cargo, 456)
train_3 = Train.new(11111, :passenger, 456)
station1 = Station.new("Удмурская")
station2 = Station.new("Вахская")
station3 = Station.new("Пионерская")
station4 = Station.new("Советская")
route1 = Route.new(station1, station2)
route2 = Route.new(station3, station4)
cargo_wagon1 = CargoWagon.new(11, 'frog', 456)
cargo_wagon2 = CargoWagon.new(33, 'mom' 45)
passenger_wagon1 = PassengerWagon.new(22, dad, 111)
passenger_wagon2 = PassengerWagon.new(44, 'heh', 658)

route1.add_station(station4)
route1.add_station(station3)
route1.delete_station(station3)
route1.all_stations


train_cargo1.speed_up(10)
train_cargo1.stop
train_cargo1.speed_up(10)
train_cargo1.speed
train_cargo1.add_wagon(cargo_wagon1)
train_cargo1.delete_wagon(cargo_wagon1)
train_cargo1.take_route(route1)


station1.trains_by_type('cargo')

station1.add_train(train_cargo1)
station1.train_dispatch(train_cargo1)
station1.output_trains

Route.instances
Station.instances
Train.instances





