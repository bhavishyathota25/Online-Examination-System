<%-- 
    Document   : teachExam
    Created on : 03-Apr-2024, 3:40:29 pm
    Author     : lenovo
--%>

<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Schedule new exam</title>
    <style>
        .container {
            display: flex;
            justify-content: space-between;
            background: #ffffff;
            align-content: center;
        }

        .container1 {
            display: flex;
            justify-items: flex-end;
            justify-content: space-evenly;
        }

        .box1 {
            margin-top: 20px;
            width: 400px;
            height: 300px;
            background: #ffffff;
            border-radius: 10px;
            padding: 20px;
        }

        .box2 {
            width: 700px;
            margin-top: 20px;
            background: #ffffff;
            border-radius: 10px;
            padding: 20px;
        }

        input[type=text] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            background: #f1f1f1;
        }
    </style>
</head>
<body style="background: #f7fbfd">
   
<div class="container">
    <h1 style="margin-left:20px;margin-top: 20px">E Tantra</h1>
    <h2 style="margin-right:20px;margin-top: 20px">New Online Exam</h2>
</div>

<div class="container1">
    <form id="myForm" action="teachviewexam.jsp" method="post" onsubmit="return validateForm()">
        <div class="box1">
            <label for="exname"><b>Exam Name</b></label>
            <input type="text" placeholder="Enter Exam Name" name="exname" required>
            <label for="ccode"><b>Course Code</b></label>
            <input type="text" placeholder="Enter Course code" name="ccode" required>
            <label for="exid"><b>Exam ID</b></label>
            <input type="text" placeholder="Create Exam ID" name="exid" required>
            <label for="uid"><b>UID</b></label>
            <input type="text" placeholder="Enter your UID" name="uid" required>
        </div>

        <div class="box2">
            <p>Multiple Choice Questions (MCQs)</p>
            <div id="mcq-section">
                 <button type="button" onclick="addMCQ()">Add MCQ</button>

                 <script>
// Initialize a counter to keep track of the number of questions
var questionCounter = 0;

function addMCQ() {
    var mcqSection = document.getElementById('mcq-section');
    var questionDiv = document.createElement('div');
    questionDiv.setAttribute('class', 'mcq-question');

    // Increment the question counter
    questionCounter++;

    // Update the hidden input for questionCounter
    document.getElementById('questionCounter').value = questionCounter;

    // Create the question label and input box
    var questionLabel = document.createElement('label');
    questionLabel.textContent = 'Question ' + questionCounter + ':';
    var questionInput = document.createElement('input');
    questionInput.type = 'text';
    questionInput.name = 'mcq_question_' + questionCounter;

    questionDiv.appendChild(questionLabel);
    questionDiv.appendChild(questionInput);

    // Create options A, B, C, D
    var options = ['A', 'B', 'C', 'D'];
    options.forEach(function(option) {
        var optionLabel = document.createElement('label');
        optionLabel.textContent = 'Option ' + option + ':';
        var optionInput = document.createElement('input');
        optionInput.type = 'text';
        optionInput.name = 'mcq_option_' + questionCounter + '_' + option;

        questionDiv.appendChild(optionLabel);
        questionDiv.appendChild(optionInput);
    });

    // Create remove button
    var removeButton = document.createElement('button');
    removeButton.type = 'button';
    removeButton.textContent = 'Remove';
    removeButton.onclick = function() { removeMCQ(this); };

    questionDiv.appendChild(removeButton);
    mcqSection.appendChild(questionDiv);
}

function removeMCQ(button) {
    // Remove the question div
    var mcqSection = document.getElementById('mcq-section');
    mcqSection.removeChild(button.parentNode);

    // Decrement the question counter and update the hidden input
    questionCounter--;
    document.getElementById('questionCounter').value = questionCounter;
}

function validateForm() {
    console.log('Validating form...');
    var inputs = document.getElementById('myForm').getElementsByTagName('input');
    for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].value.trim() === '') {
            console.log('Please fill all fields.');
            return false;
        }
    }
    console.log('Form validated successfully.');
    return true;
}

// Add this line to create the hidden input when the script loads
document.addEventListener('DOMContentLoaded', function() {
    var hiddenInput = document.createElement('input');
    hiddenInput.type = 'hidden';
    hiddenInput.id = 'questionCounter';
    hiddenInput.name = 'questionCounter';
    hiddenInput.value = questionCounter;
    document.getElementById('myForm').appendChild(hiddenInput);
});
</script>

                 
                 
            </div>
            <br>
            <div style="align-content: end">
               
                <button class="button" type="submit" style="align-items: flex-end">Submit</button>
            </div>
        </div>
    </form>
</div>


</body>
</html>
teachExam.jsp