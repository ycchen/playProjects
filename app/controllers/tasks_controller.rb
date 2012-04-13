class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @incomplete_tasks = Task.find_all_by_complete('f')
    @complete_tasks = Task.find_all_by_complete('t')
    @tasks = Task.search(params[:search])

    @tasks_near_due = Task.find_near_due(Date.today)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def completed
    #@tasks = Task.find(:all, :conditions => "complete = 'f'")
    #@tasks = Task.find(:all, :conditions => 'complete = f')
    @tasks = Task.find_all_by_complete('t')
  end

  def complete
    # TODO mark selected task as complete
    #Task.update_all({:complete => true, :id => params[:task_ids]})
    # @task = Task.find(params[:task_ids])
    # @task.update_attribute :complete, 't'

    Task.update_all(["complete = ?", 't'], :id => params[:task_ids])
    flash[:notice] = "marked task as complete"
    redirect_to tasks_path
  end
end
