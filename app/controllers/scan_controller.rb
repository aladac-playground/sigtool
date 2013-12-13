class ScanController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  def paste
  end

  def view
  end

  def add
  end
  
  def parse
    if ! params[:scan_id]
      scan=Scan.create
    else
      scan=Scan.find(params[:scan_id])
    end
    id = scan.id
    data=params[:paste]
    data.split("\n").each do |line|
      line.chomp!
      scanrow = line.split("\t")
      if scanrow.length == 6
        type = Type.where(name: scanrow[3]).first
        if type.nil?
          type = Type.create(name: scanrow[3])
        end
        type_id = type.id
        
        group = Group.where(name: scanrow[2]).first
        if group.nil?
          group = Group.create(name: scanrow[2])
        end
        group_id = group.id
        sig_id = scanrow[0]
        
        Sig.create(sig_id: scanrow[0], group_id: group_id, type_id: type_id, scan_id: scan.id )
      end
    end
    redirect_to :back
  end
end
