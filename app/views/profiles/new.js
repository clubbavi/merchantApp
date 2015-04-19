if ("<%= @cat_id %>"){
$("#product_slection").html("<%= escape_javascript(render(:partial =>'product_selection', :locals =>{ :cat_id => @cat_id} )) %>");
}
if ("<%= @pro_id %>"){
$("#section_slection").html("<%= escape_javascript(render(:partial =>'section_selection', :locals =>{ :pro_id => @pro_id} )) %>");
}
 