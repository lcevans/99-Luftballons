class Luftballon < ActiveRecord::Base
	BALLON_COLORS = [
		"red",
		"orange",
		"yellow",
		"green",
		"blue",
		"indigo",
		"violet"
	]

	BALLON_GAS_TYPES = [
		"helium",
		"hydrogen",
		"air"
	]

	BALLON_ORIGINS = [
		"USA",
		"GER",
		"JAP",
		"CHN",
		"UK"
	]

	attr_accessible :inscription, :color, :gas, :psi, :origin, :manufacture_date

	validates(
		:inscription,
		:color,
		:gas,
		:psi,
		:origin,
		:manufacture_date,
		:presence => true
	)

	validates :color, :inclusion => BALLON_COLORS
	validates :gas, :inclusion => BALLON_GAS_TYPES
	validates :origin, :inclusion => BALLON_ORIGINS
	validates :psi, :numericality => {only_integer: true}
	

end
