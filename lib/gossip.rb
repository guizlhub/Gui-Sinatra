require 'pry'
require 'csv'

class Gossip
attr_accessor :author, :content

#initialise la classe Gossip avec un nouveau potin
def initialize (author, content)
    @author = author
    @content = content
end

#enregistrement du potin dans la BDD
def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
end

def self.all
    all_gossips = [] #on initialise un array vide
    CSV.read("./db/gossip.csv").each do |csv_line| #va chercher chacune des lignes du csv do
        all_gossips << Gossip.new(csv_line[0], csv_line[1]) #crée un gossip avec les infos de la ligne
      end #all_gossips << gossip qui vient d'être créé
      return all_gossips   #on retourne un array rempli d'objets Gossip
end

def self.find(id)
current_gossip = Gossip.all[id]
return current_gossip 
end

end
