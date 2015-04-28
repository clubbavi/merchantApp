if ("<%= @pro_id %>"){
$("#section_options").html("<%= escape_javascript(render(:partial =>'section_selection', :locals =>{ :pro_id => @pro_id} )) %>");
}