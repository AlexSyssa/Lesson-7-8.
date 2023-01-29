train_cargo1 = CargoTrain.new(248, 'Cargo')
train_passenger1 = PassengerTrain.new(250, 'Passenger')
train_1 = Train.new(222, 'Cargo')
train_3 = Train.new(111, 'Passenger')
station1 = Station.new("Удмурская")
station2 = Station.new("Вахская")
station3 = Station.new("Пионерская")
station4 = Station.new("Советская")
route1 = Route.new(station1, station2)
route2 = Route.new(station3, station4)
cargo_wagon1 = CargoWagon.new(11)
cargo_wagon2 = CargoWagon.new(33)
cargo_wagon3 = CargoWagon.new(55)
cargo_wagon4 = CargoWagon.new(77)
passenger_wagon1 = PassengerWagon.new(22)
passenger_wagon2 = PassengerWagon.new(44)
passenger_wagon3 = PassengerWagon.new(66)
passenger_wagon4 = PassengerWagon.new(88)

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
# no
station1.output_trains

Route.instances
Station.instances
Train.instances








