class QuestionviewController < ApplicationController
  def index
  $cur_gen=params["gen"]
  $cur_subgen=params["subgen"]
  if $chng==0
	  @qry=State.where(genre:$cur_gen,subgenre:$cur_subgen,userid:session[:user_id])
	  if @qry.to_s==nil.to_s
	  	  print "\n\n1\n\n"
		  $query=Mcq.find_by(gen:$cur_gen,subgen:$cur_subgen)
		  if $query.to_s==nil.to_s
		  	print "\n\nENTERED1\n\n"
		  	$cur_qid="NQ"
		  else
		  	print "\n\nENTERED2\n\n"
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
				  	$score=0
				    @state = State.new("userid" => session[:user_id], "qsnid" => $cur_qid, "genre" => $cur_gen,"subgenre" => $cur_subgen,"score" => $score,"l1" => 0,"l2" => 0)
				    @state.save
				    $l1=0
				    $l2=0
				    print "\n\nNew Created\n\n"
				    break
				end
			end
		 end
	  else
	  	#print "\n\n\n"
	  	#print "GEN:"
	  	#print $cur_gen
	  	#print "\nSUBGEN:"
	  	#print $cur_subgen
	  	#print "\nUserId:"
	  	#print session[:user_id]
	  	#print "In else"
	  	#print "\n\n\n"
	    @qry=State.where(genre:$cur_gen,subgenre:$cur_subgen,userid:session[:user_id])
	        @has_entered=0
			@qry.each do |state|
				#print "\n\nQSNID"
				#print state.qsnid
				#print "\n\n"
				@has_entered=1
			  	$cur_qid=state.qsnid
			  	$score=state.score
			  	$l1=state.l1
			  	$l2=state.l2
			  	if($cur_qid!="END")
			  		print "\n\n2\n\n"
				  	@query=Mcq.find($cur_qid)
				  	$ques=@query.question
				  	$cur_gen=state.genre
				  	$cur_subgen=state.subgenre
				  	$a=@query.optA
				  	$b=@query.optB
				  	$c=@query.optC
				  	$d=@query.optD
				  	$crt=@query.corrOpt
				end
			  	break
			end
		  if @has_entered==0
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
					  	$score=0
					    @state = State.new("userid" => session[:user_id], "qsnid" => $cur_qid, "genre" => $cur_gen,"subgenre" => $cur_subgen,"score" => $score,"l1" => 0,"l2" => 0)
					    @state.save
					    break
					end
				end
			end
		end
	  end
  end
end

  def next
  	print params
  	if params["sel_opt"].to_s == $crt.to_s
  		$truth=1
  		$score+=10
	else
		$truth=0
	end
  	$prev_id=$cur_qid
  	$once=0
  	$entered=0
  	#print "\nPrevId:"
  	#print $prev_id
	$query=Mcq.all
	$query.each do |ques|
		#print "\n\n"
		#print ques.id
		#print $prev_id
		#print "\n\n"
		if $once==1 and ques.gen===$cur_gen and ques.subgen===$cur_subgen
			#print "\n\nMatched\n\n"
			$cur_qid=ques.id
		  	$ques=ques.question
		  	$a=ques.optA
		  	$b=ques.optB
		  	$c=ques.optC
		  	$d=ques.optD
		  	$crt=ques.corrOpt
		  	$entered=1
		  	break
		end
		if (ques.id).to_s==($prev_id).to_s
			$once=1
		end
	end
	if $entered==0
		#print "\n\n\nNo more ques\n\n\n"
		$cur_qid="END"
	end
	$chng=1
	#print "AT END\n\n"
	#print $cur_subgen
	#print $cur_gen
	#print "\n\n"
	$l1=params["l1"]
	$l2=params["l2"]
    @state = State.where("userid" => session[:user_id],"genre" => $cur_gen,"subgenre" => $cur_subgen).update_all("userid" => session[:user_id], "qsnid" => $cur_qid, "genre" => $cur_gen,"subgenre" => $cur_subgen,"score" => $score,"l1" => params["l1"],"l2" => params["l2"])
	redirect_to controller:'questionview',action:'index',gen:$cur_gen,subgen:$cur_subgen
  end

  def prev
  	print params;
  	$chng=0;
  	$l1=0;
  	$l2=0;
  	State.where("userid" => session[:user_id],"genre" => params["gnm"],"subgenre" => params["snm"]).destroy_all;
	redirect_to controller:'questionview',action:'index',gen:params["gnm"],subgen:params["snm"];  	
  end
end