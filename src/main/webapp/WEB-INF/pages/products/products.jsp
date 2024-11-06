<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Products</title>
    <link rel="stylesheet" type="text/css" href="<s:url value='/css/output.css' />">
    <sj:head />
  </head>

  <body class="bg-gray-100 p-8">
    <div class="max-w-3xl mx-auto bg-white p-6 shadow-lg rounded-lg">
      <h1 class="text-3xl font-semibold mb-6 text-gray-800">Products</h1>

      <!-- Product Form -->
      <s:form id="createForm" action="save" cssClass="space-y-4 w-full">
      
        <s:textfield
          cssClass="w-full border border-gray-300 focus:ring-blue-500 focus:border-blue-500 rounded-md p-2"
          name="product.name" label="Name" />
        <s:textfield
          cssClass="w-full border border-gray-300 focus:ring-blue-500 focus:border-blue-500 rounded-md p-2"
          name="product.price" label="Price" />
        <s:textfield
          cssClass="w-full border border-gray-300 focus:ring-blue-500 focus:border-blue-500 rounded-md p-2"
          name="product.quantity" label="Quantity" />
        <s:textfield
          cssClass="w-full border border-gray-300 focus:ring-blue-500 focus:border-blue-500 rounded-md p-2"
          name="product.description" label="Description" />
        <s:textfield
          cssClass="w-full border border-gray-300 focus:ring-blue-500 focus:border-blue-500 rounded-md p-2"
          name="product.image" label="Image" />
       
        <sj:submit formId="createForm" targets="ajax-results" value="Create" cssClass="w-full bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600" />
      </s:form>

      <!-- Search Form -->
      <div class="mt-8">
        <s:form id="searchForm" action="search" method="get" cssClass="flex space-x-4">
          <s:textfield
            cssClass="w-full border border-gray-300 focus:ring-blue-500 focus:border-blue-500 rounded-md p-2"
            name="keyword" label="Search" value="%{keyword}" />
          <sj:submit
            formId="searchForm"
            value="Search"
            targets="ajax-results"
            indicator="loading-indicator"
            cssClass="w-full bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600" />
        </s:form>
      </div>

      <div id="loading-indicator" class="text-gray-500 text-sm mt-2" style="display:none;">
        Loading...
      </div>

      <!-- Product Table -->
      <div class="mt-8 overflow-x-auto">
        <table class="min-w-full bg-white border border-gray-300">
          <thead class="bg-gray-200">
            <tr>
              <th class="px-4 py-2 text-left text-gray-600 font-semibold">ID</th>
              <th class="px-4 py-2 text-left text-gray-600 font-semibold">Name</th>
              <th class="px-4 py-2 text-left text-gray-600 font-semibold">Price</th>
              <th class="px-4 py-2 text-left text-gray-600 font-semibold">Quantity</th>
              <th class="px-4 py-2 text-left text-gray-600 font-semibold">Description</th>
              <th class="px-4 py-2 text-left text-gray-600 font-semibold">Image</th>
              <th class="px-4 py-2 text-left text-gray-600 font-semibold"> Delete</th>
            </tr>
          </thead>
          
          <tbody id="ajax-results" class="text-gray-700">
            <!-- Table content dynamically added here -->
          </tbody>
        
        </table>
      </div>
    </div>
  </body>
</html>
