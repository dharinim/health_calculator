require 'sqlite3'

db = SQLite3::Database.new("weight_calories.db")

create_table_weight = <<-SQL
create table IF NOT EXISTS weight_calc(
    height int primary key,
    n_min int,
    n_max int,
    ow_min int,
    ow_max int,
    ob_min int,
    ob_max int
)
SQL

create_table_calories_male = <<-SQL
create table IF NOT EXISTS calories_male(
    age int primary key,
    calories int 
)
SQL
create_table_calories_female = <<-SQL
create table IF NOT EXISTS calories_female(
    age int primary key,
    calories int 
)
SQL

db.execute('drop table weight_calc')
db.execute('drop table calories_male')
db.execute('drop table calories_female')

db.execute(create_table_weight)
db.execute(create_table_calories_male)
db.execute(create_table_calories_female)

insert_weights = [
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(58,91,115,119,138,143,191);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(59,94,119,124,143,148,198);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(60,97,123,128,148,153,204);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(61,100,127,132,153,158,211);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(62,104,131,136,158,164,218);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(63,107,135,141,163,169,225);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(64,110,140,145,169,174,232);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(65,114,144,150,174,180,240);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(66,118,148,155,179,186,247);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(67,121,153,159,185,191,255);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(68,125,158,164,190,197,262);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(69,128,162,169,196,203,270);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(70,132,167,174,202,207,278);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(71,136,172,179,208,215,286);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(72,140,177,184,213,221,294);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(73,144,182,189,219,227,302);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(74,148,186,194,225,233,311);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(75,152,192,200,232,240,319);',
	'insert into weight_calc(height,n_min,n_max,ow_min,ow_max,ob_min,ob_max) values(76,156,197,205,238,246,328);',
]


insert_calories_m = [
	'insert into calories_male(age,calories) values(2,1000)',
	'insert into calories_male(age,calories) values(3,1400)',
	'insert into calories_male(age,calories) values(4,1400)',
	'insert into calories_male(age,calories) values(5,1400)',
	'insert into calories_male(age,calories) values(6,1600)',
	'insert into calories_male(age,calories) values(7,1600)',
	'insert into calories_male(age,calories) values(8,1600)',
	'insert into calories_male(age,calories) values(9,1800)',
	'insert into calories_male(age,calories) values(10,1800)',
	'insert into calories_male(age,calories) values(11,2000)',
	'insert into calories_male(age,calories) values(12,2200)',
	'insert into calories_male(age,calories) values(13,2200)',
	'insert into calories_male(age,calories) values(14,2400)',
	'insert into calories_male(age,calories) values(15,2600)',
	'insert into calories_male(age,calories) values(16,2800)',
	'insert into calories_male(age,calories) values(17,2800)',
	'insert into calories_male(age,calories) values(18,2800)',
	'insert into calories_male(age,calories) values(19,2800)',
	'insert into calories_male(age,calories) values(20,2800)',
	'insert into calories_male(age,calories) values(21,2800)',
	'insert into calories_male(age,calories) values(22,2800)',
	'insert into calories_male(age,calories) values(23,2800)',
	'insert into calories_male(age,calories) values(24,2800)',
	'insert into calories_male(age,calories) values(25,2800)',
	'insert into calories_male(age,calories) values(26,2600)',
	'insert into calories_male(age,calories) values(27,2600)',
	'insert into calories_male(age,calories) values(28,2600)',
	'insert into calories_male(age,calories) values(29,2600)',
	'insert into calories_male(age,calories) values(30,2600)',
	'insert into calories_male(age,calories) values(31,2600)',
	'insert into calories_male(age,calories) values(32,2600)',
	'insert into calories_male(age,calories) values(33,2600)',
	'insert into calories_male(age,calories) values(34,2600)',
	'insert into calories_male(age,calories) values(35,2600)',
	'insert into calories_male(age,calories) values(36,2600)',
	'insert into calories_male(age,calories) values(37,2600)',
	'insert into calories_male(age,calories) values(38,2600)',
	'insert into calories_male(age,calories) values(39,2600)',
	'insert into calories_male(age,calories) values(40,2600)',
	'insert into calories_male(age,calories) values(41,2600)',
	'insert into calories_male(age,calories) values(42,2600)',
	'insert into calories_male(age,calories) values(43,2600)',
	'insert into calories_male(age,calories) values(44,2600)',
	'insert into calories_male(age,calories) values(45,2600)',
	'insert into calories_male(age,calories) values(46,2400)',
	'insert into calories_male(age,calories) values(47,2400)',
	'insert into calories_male(age,calories) values(48,2400)',
	'insert into calories_male(age,calories) values(49,2400)',
	'insert into calories_male(age,calories) values(50,2400)',
	'insert into calories_male(age,calories) values(51,2400)',
	'insert into calories_male(age,calories) values(52,2400)',
	'insert into calories_male(age,calories) values(53,2400)',
	'insert into calories_male(age,calories) values(54,2400)',
	'insert into calories_male(age,calories) values(55,2400)',
	'insert into calories_male(age,calories) values(56,2400)',
	'insert into calories_male(age,calories) values(57,2400)',
	'insert into calories_male(age,calories) values(58,2400)',
	'insert into calories_male(age,calories) values(59,2400)',
	'insert into calories_male(age,calories) values(60,2400)',
	'insert into calories_male(age,calories) values(61,2400)',
	'insert into calories_male(age,calories) values(62,2400)',
	'insert into calories_male(age,calories) values(63,2400)',
	'insert into calories_male(age,calories) values(64,2400)',
	'insert into calories_male(age,calories) values(65,2400)',
	'insert into calories_male(age,calories) values(67,2200)',
	'insert into calories_male(age,calories) values(68,2200)',
	'insert into calories_male(age,calories) values(69,2200)',
	'insert into calories_male(age,calories) values(70,2200)',
	'insert into calories_male(age,calories) values(71,2200)',
	'insert into calories_male(age,calories) values(72,2200)',
	'insert into calories_male(age,calories) values(73,2200)',
	'insert into calories_male(age,calories) values(74,2200)',
	'insert into calories_male(age,calories) values(75,2200)',
	'insert into calories_male(age,calories) values(76,2200)',
]


insert_calories_f = [
	'insert into calories_female(age,calories) values(2,1000)',
	'insert into calories_female(age,calories) values(3,1200)',
	'insert into calories_female(age,calories) values(4,1400)',
	'insert into calories_female(age,calories) values(5,1400)',
	'insert into calories_female(age,calories) values(6,1400)',
	'insert into calories_female(age,calories) values(7,1600)',
	'insert into calories_female(age,calories) values(8,1600)',
	'insert into calories_female(age,calories) values(9,1600)',
	'insert into calories_female(age,calories) values(10,1800)',
	'insert into calories_female(age,calories) values(11,1800)',
	'insert into calories_female(age,calories) values(12,2000)',
	'insert into calories_female(age,calories) values(13,2000)',
	'insert into calories_female(age,calories) values(14,2000)',
	'insert into calories_female(age,calories) values(15,2000)',
	'insert into calories_female(age,calories) values(16,2000)',
	'insert into calories_female(age,calories) values(17,2000)',
	'insert into calories_female(age,calories) values(18,2000)',
	'insert into calories_female(age,calories) values(19,2200)',
	'insert into calories_female(age,calories) values(20,2200)',
	'insert into calories_female(age,calories) values(21,2200)',
	'insert into calories_female(age,calories) values(22,2200)',
	'insert into calories_female(age,calories) values(23,2200)',
	'insert into calories_female(age,calories) values(24,2200)',
	'insert into calories_female(age,calories) values(25,2200)',
	'insert into calories_female(age,calories) values(26,2000)',
	'insert into calories_female(age,calories) values(27,2000)',
	'insert into calories_female(age,calories) values(28,2000)',
	'insert into calories_female(age,calories) values(29,2000)',
	'insert into calories_female(age,calories) values(30,2000)',
	'insert into calories_female(age,calories) values(31,2000)',
	'insert into calories_female(age,calories) values(32,2000)',
	'insert into calories_female(age,calories) values(33,2000)',
	'insert into calories_female(age,calories) values(34,2000)',
	'insert into calories_female(age,calories) values(35,2000)',
	'insert into calories_female(age,calories) values(36,2000)',
	'insert into calories_female(age,calories) values(37,2000)',
	'insert into calories_female(age,calories) values(38,2000)',
	'insert into calories_female(age,calories) values(39,2000)',
	'insert into calories_female(age,calories) values(40,2000)',
	'insert into calories_female(age,calories) values(41,2000)',
	'insert into calories_female(age,calories) values(42,2000)',
	'insert into calories_female(age,calories) values(43,2000)',
	'insert into calories_female(age,calories) values(44,2000)',
	'insert into calories_female(age,calories) values(45,2000)',
	'insert into calories_female(age,calories) values(46,2000)',
	'insert into calories_female(age,calories) values(47,2000)',
	'insert into calories_female(age,calories) values(48,2000)',
	'insert into calories_female(age,calories) values(49,2000)',
	'insert into calories_female(age,calories) values(50,2000)',
	'insert into calories_female(age,calories) values(51,1800)',
	'insert into calories_female(age,calories) values(52,1800)',
	'insert into calories_female(age,calories) values(53,1800)',
	'insert into calories_female(age,calories) values(54,1800)',
	'insert into calories_female(age,calories) values(55,1800)',
	'insert into calories_female(age,calories) values(56,1800)',
	'insert into calories_female(age,calories) values(57,1800)',
	'insert into calories_female(age,calories) values(58,1800)',
	'insert into calories_female(age,calories) values(59,1800)',
	'insert into calories_female(age,calories) values(60,1800)',
	'insert into calories_female(age,calories) values(61,1800)',
	'insert into calories_female(age,calories) values(62,1800)',
	'insert into calories_female(age,calories) values(63,1800)',
	'insert into calories_female(age,calories) values(64,1800)',
	'insert into calories_female(age,calories) values(65,1800)',
	'insert into calories_female(age,calories) values(67,1800)',
	'insert into calories_female(age,calories) values(68,1800)',
	'insert into calories_female(age,calories) values(69,1800)',
	'insert into calories_female(age,calories) values(70,1800)',
	'insert into calories_female(age,calories) values(71,1800)',
	'insert into calories_female(age,calories) values(72,1800)',
	'insert into calories_female(age,calories) values(73,1800)',
	'insert into calories_female(age,calories) values(74,1800)',
	'insert into calories_female(age,calories) values(75,1800)',
	'insert into calories_female(age,calories) values(76,1800)',
]

[insert_weights, insert_calories_f, insert_calories_m].each do |statements|
	statements.each do |statement|
		db.execute(statement)
	end
end

DB = db




