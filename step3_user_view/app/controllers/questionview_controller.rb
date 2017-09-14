class QuestionviewController < ApplicationController
  def index
  if $chng==0
	  $cur_gen=params["gen"]
	  $cur_subgen=params["subgen"]
	  $query=Mcq.find_by(gen:$cur_gen,subgen:$cur_subgen)
	  if $query==nil
	  	$cur_qid="NQ"
	  else
	  	$query=Mcq.all
		$query.each do |ques|
			if ques.gen==$cur_gen and ques.subgen==$cur_subgen
			  	$cur_qid=ques.id
			  	$ques=ques.question
			  	$a=ques.optA
			  	$b=ques.optB
			  	$c=ques.optC
			  	$d=ques.optD
			  	$crt=ques.corrOpt
			  	break
			end
		  end
	 	end
	end
  end

  def next
  	if params["sel_opt"] == $crt
  		$truth=1
	else
		$truth=0
	end
  	@prev_id=$cur_qid
  	@once=0
  	@entered=0
	$query=Mcq.all
	$query.each do |ques|
		if @once==1
			$cur_qid=ques.id
		  	$ques=ques.question
		  	$a=ques.optA
		  	$b=ques.optB
		  	$c=ques.optC
		  	$d=ques.optD
		  	$crt=ques.corrOpt
		  	@entered=1
		  	break
		end
		if ques.id==@prev_id
			@once=1
		end
		end
	if @entered==0
		$cur_qid="NQ"
	end
	$chng=1
	redirect_to controller:'questionview',action:'index',gen:$cur_gen,subgen:$cur_subgen
  end

  def prev
  end
end