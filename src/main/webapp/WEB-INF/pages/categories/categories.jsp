<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Basic Struts 2 Application - Welcome</title>
    <link rel="stylesheet" type="text/css" href="<s:url value='/css/output.css' />">
</head>

<body class="bg-gray-100 text-gray-800 min-h-screen flex flex-col items-center py-10">
    <h2 class="text-3xl font-bold mb-6 text-gray-700">Categories</h2>

    <!-- Create Category form -->
    <div class="bg-white shadow-md rounded-lg p-6 mb-8 w-full ">
        <s:form cssClass="space-y-4" action="save">
            
            <s:textfield label="name" name="category.name" cssClass="w-full border-gray-300 focus:ring-blue-500 focus:border-blue-500 rounded-md p-2 border border-gray-400" placeholder="Enter category name" />
            <s:textfield label="description" name="category.description" cssClass="w-full border-gray-300 focus:ring-blue-500 focus:border-blue-500 rounded-md p-2 border border-gray-400" placeholder="Enter description" />
        
            <s:submit cssClass="bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded w-full" value="Add" />
        </s:form>
    </div>

    <!-- Search form -->
    <div class="bg-white shadow-md rounded-lg p-6 mb-8 w-full ">
        <s:form cssClass="space-y-4" action="search">
            <s:textfield name="keyword" cssClass="w-full border-gray-300 focus:ring-blue-500 focus:border-blue-500 rounded-md p-2 border border-gray-400" placeholder="Enter search keyword" />
            
            <s:submit cssClass="bg-gray-500 hover:bg-gray-600 text-white py-2 px-4 rounded w-full" value="Search" />
        </s:form>
    </div>

    <!-- Category list -->
    <ul class="w-full  space-y-4">
        <s:iterator value="categories">
            <li class="bg-white p-4 rounded-lg shadow flex justify-between items-center">
                <div>
                    <span class="text-lg font-semibold text-blue-600">
                         <s:url action="findByCategory" namespace="/products" var="categoryUrl">
                            <s:param name="categoryName" value="%{name}" />
                        </s:url>
                        <s:property value="id" /> - 
                        <s:a cssClass="hover:underline text-blue-500" href="%{categoryUrl}"><s:property value="name" /></s:a>
                    </span>
                </div>
                <s:url action="delete" var="deleteUrl">
                    <s:param name="categoryId" value="%{id}" />
                </s:url>
                <s:a href="%{deleteUrl}" cssClass="text-red-500 hover:text-red-700 ml-4">Delete</s:a>
            </li>
        </s:iterator>
    </ul>

</body>
</html>
