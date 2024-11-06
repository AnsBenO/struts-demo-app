<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
      <s:iterator value="products">
            <tr>
                  <td><s:property value="id" /></td>
                  <td><s:property value="name" /></td>
                  <td><s:property value="price" /></td>
                  <td><s:property value="quantity" /></td>
                  <td><s:property value="description" /></td>
                  <td><s:property value="image" /></td>
                  <td>
                        <s:url action="delete" var="deleteUrl">
                              <s:param name="productId" value="%{id}" />
                        </s:url>
                        <sj:a targets="ajax-results" href="%{deleteUrl}">Delete</sj:a>
                  </td>
            </tr>
     </s:iterator>    
