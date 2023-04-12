package kz.bitlab.techorda.db;

import java.util.ArrayList;

public class DBManager {
    public static Long id = 5L;
    public static ArrayList<Tasks> tasks = new ArrayList<>();
    static {
        tasks.add(new Tasks(
                1L,
                "Сделать пробежку",
                "Свулать побежку 10км в темпе 5 мин/км.",
                "2023-04-10",
                "Нет"
        )
        );
        tasks.add(new Tasks(
                2L,
                "Читать",
                "надо прочесть 100стр книги Кочевники",
                "2023-04-11",
                "Нет"
                )
        );
        tasks.add(new Tasks(
                3L,
                "Записаться на курсы английского",
                "Записаться на курсы английского",
                "2023-04-15",
                "Нет"
                )
        );
        tasks.add(new Tasks(
                4L,
                "Изучить маркетинг",
                "Прочесть 5 книг по маркетингу  и записаться на курсы",
                "2023-05-01",
                "Нет"
                )
        );

    }
    public static void addTask(Tasks task){
        task.setId(id);
        tasks.add(task);
        id++;
    }//этот метод добавляет новую задачу в список

     public static Tasks getTask(Long id){
        Tasks task_one = null;
        for(Tasks task: tasks){
            if(id == task.getId()){
                task_one = task;
            }
        }
        return task_one;
    } // этот метод возвращает объект задачи по id

    public static  ArrayList getAllTasks(){
        return tasks;
    } //этот метод возвращает список всех задач

    public static void deleteTask(Long id){
        for(int i=0;i<tasks.size(); i++){
            if(id==tasks.get(i).getId()){
                tasks.remove(i);
                break;
            }
        }
    } //этот метод удаляет задачу из списка по id
    public static void updateTask(Tasks task){
        for(int i=0;i<tasks.size(); i++){
            if(task.getId()==tasks.get(i).getId()){
               tasks.set(i,task);
               break;
            }
        }
    }
}
