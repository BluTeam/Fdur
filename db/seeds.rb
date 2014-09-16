# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Project.first.nil?
  project = User.find(1).projects.create name: '电影待看表--小李', image: "http://image2.sina.com.cn/ent/x/2006-11-23/ac7833b449ac5759b25a64b4d7d94eb2.JPG",
                                         description: '十一电影待看表，一天一部', is_public: true, state: 'open'

  project.milestones.create name: '《血钻》'
  project.milestones.create name: '《了不起的盖茨比》'
  project.milestones.create name: '《逍遥法外》'
  project.milestones.create name: '《泰坦尼克号》'
  project.milestones.create name: '《飞行家》'
  project.milestones.create name: '《胡佛传》'
  project.milestones.create name: '《禁闭岛》'

end