class ScanController < ApplicationController
  before_filter :check_trust, :only => :paste
  skip_before_filter :verify_authenticity_token  
  def paste
  end
  
  def view
    if params[:scan_id]
      @sigs = Sig.where(scan_id: params[:scan_id]).order(:system_id, :group_id)
      if @sigs.empty?
        flash[:warning] = "No results under that ScanID"
        redirect_to(root_path)
      end
    else
      flash[:warning] = "Requires ScanID"
      redirect_to root_path
    end
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
    system_name = request.headers["HTTP_EVE_SOLARSYSTEMNAME"]
    cons_name = request.headers["HTTP_EVE_CONSTELLATIONNAME"]
    
    cons = Cons.where(name: cons_name).first
    if ! cons
      cons = Cons.create(name: cons_name)
    end

    cons_id = cons.id
    
    system = System.where(name: system_name).first
    
    if ! system
      system = System.create(name: system_name, cons_id: cons_id)
    end
    
    system_id = system.id
    
    data=params[:paste]
    p data
    data.split("\n").each do |line|
      line.chomp!
      p line
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
        
        d = { sig_id: scanrow[0], group_id: group_id, type_id: type_id, scan_id: scan.id, system_id: system_id }
        p d
        Sig.create(sig_id: scanrow[0], group_id: group_id, type_id: type_id, scan_id: scan.id, system_id: system_id )
      end
    end
    redirect_to "/scan/view?scan_id=#{id}"
  end
  def delete
    if params[:sig_id]
      sig=Sig.where(sig_id: params[:sig_id]).first
      if sig
        sig.delete
      end
    end
    redirect_to :back
  end
end

private
def check_trust
  if request.headers["HTTP_EVE_TRUSTED"] != "Yes"
    flash[:warning] = "Accept IGB Trust and reload"
    @trust = false
  else
    @trust = true
  end
end

  