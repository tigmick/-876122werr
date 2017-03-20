# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
  # cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
  # Mayor.create(name: 'Emanuel', city: cities.first)

  industry = Industry.create([
    {title: "Textile Mills"},
    {title: "Textile Product Mills"},
    {title: "Telecommunications"},
    {title: "Transit and Ground Passenger "},
    {title: "ransportation"},
    {title: "Search Engine"},
    {title: "Application Development"},
    {title: "PC, Laptops & Printers"},
    {title: "Mobile Consumer Devices"},
    {title: "E-Commerce"},
    {title: "Social Media"},
    {title: "Autonomous Driving"},
    {title: "Application Monitoring"},
    {title: "Enterprise Storage"},
    {title: "Unified Communications"},
    {title: "Virtualization"},
    {title: "Video Surveillance"},
    {title: "Enterprise Software"},
    {title: "Cloud Networking & Equipment"}
  ])
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')