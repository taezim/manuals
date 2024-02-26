package com.springmvc.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.domain.Lesson;
import com.springmvc.domain.LessonReview;
import com.springmvc.service.LessonReviewService;
import com.springmvc.service.LessonService;

@Controller
@RequestMapping("/lessons")
public class LessonController 
{
	
      @Autowired
      private LessonService ls;
      
      @Autowired
      private LessonReviewService lessonReviewService;
      
   // READ
      @GetMapping
      public String requestLessonList(Model model) 
      {
         List<Lesson> list = ls.readAllClass(); // 호출하니까 이동해야지
         model.addAttribute("list", list); // list. 해서 lessons.jsp에서 꺼내기
         return "/Lesson/lessons";
      }
      
      @GetMapping("/all")
      public String requestAllLessons(Model model) 
      {
         List<Lesson> list = ls.readAllClass(); // 호출하니까 이동해야지
         model.addAttribute("list", list);
         return "/Lesson/lessons";
      }
      
      @GetMapping("/lesson")
      public String requestLessonById(@RequestParam("id") String classId, Model model)
      {
         Lesson lsById = ls.readClassById(classId);
         double avgScore = lessonReviewService.calculateAvgScore(classId);
         model.addAttribute("ls", lsById); // product.jsp 에서 pd. 해서 꺼내쓰면됨
         model.addAttribute("avgScore",avgScore);

         System.out.println("avgScore : "+avgScore);
         return "/Lesson/lesson";
      }
      
      @GetMapping("/add")
      public String requestAddLessonForm(@ModelAttribute("addLesson")Lesson lesson) 
      {
         return "/Lesson/addLesson";
      }

      @PostMapping("/add")
      public String submitAddNewLesson(@ModelAttribute("addLesson")Lesson lesson) 
      {
         
         System.out.println("PostMapping 도착");
         ls.setNewClass(lesson);
         return "redirect:/lessons";
      }
      
      @GetMapping("/update")
      public String getUpdateLessonForm(@ModelAttribute("updateLesson") Lesson lesson, @RequestParam("id") String lessonId, Model model) 
      {
         Lesson lsById = ls.readClassById(lessonId);
         model.addAttribute("lesson",lsById); // lesson.해서 꺼내쓰기
         
         return "/Lesson/updateLesson";      
      }
      
      @PostMapping("/update")
      public String submitUpdateLessonForm(@ModelAttribute("updateLesson") Lesson lesson) 
      {
         ls.setUpdateClass(lesson);
         return "redirect:/lessons";      
      }
      
      @RequestMapping(value="/delete")
      public String getDeleteLessonForm(Model model, @RequestParam("id") String classId) 
      {
         ls.setDeleteClass(classId);
         return "redirect:/lessons";
      }
      
}