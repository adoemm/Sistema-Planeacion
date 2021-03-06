<%-- 
    Document   : addDataSheet
    Created on : Oct 6, 2016, 5:55:06 PM
    Author     : emmanuel
--%>

<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" language="java"%>
 <link href="../rsc/css/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> 
<%@ include file="/gui/pageComponents/globalSettings.jsp"%>
<%    try {
        if (fine) {
            if (request.getParameter(WebUtil.encode(session, "imix")) != null) {
                String access4ThisPage = "addDataSheet";
                LinkedList<String> userAccess = (LinkedList<String>) session.getAttribute("userAccess");
                if (UserUtil.isAValidUser(access4ThisPage, userAccess)) {
                    if (PageParameters.getParameter("SiteOnMaintenance").equals("true")) {
                        String redirectURL = "" + PageParameters.getParameter("mainController") + "?exit=1";
                        response.sendRedirect(redirectURL);
                    } else {
                        LinkedList dataPlantel= null;
                        int idPlantel= Integer.parseInt(WebUtil.decode(session, request.getParameter("idPlantel")));
                              dataPlantel= QUID.selectDataPlantel(idPlantel);
%>

<!DOCTYPE html>
<html lang="<%=PageParameters.getParameter("Content-Language")%>">
    <head>
        <title>Ficha Tecnica</title>
        <jsp:include page='<%=PageParameters.getParameter("globalLibs")%>'/>        
        <jsp:include page='<%=PageParameters.getParameter("styleFormCorrections")%>'/>
        <script type="text/javascript" language="javascript" charset="utf-8">
            window.history.forward();
            function noBack() {
                window.history.forward();
            }
             function enviarInfocontroller() {
                $.ajax({type: 'POST'
                    , contentType: 'application/x-www-form-urlencoded;charset=utf-8'
                    , cache: false
                    , async: false
                    , url: '<%=PageParameters.getParameter("mainController")%>'
                    , data: $('#agregaFichaTecnica').serialize()
                    , success: function (response) {
                        $('#wrapper').find('#divResult').html(response);
                    }});
            }
            function enviarInfoToAgregaEtapaDesarrollo(form)
            {
              
                        form.action='<%=PageParameters.getParameter("mainContext") + PageParameters.getParameter("gui")%>/agregaEtapaDesarrollo.jsp';
                        form.submit();
            }
            
            function resetForm() {
                
                document.getElementById("valuePersonalAdmin").value = '';
                document.getElementById("valueDocentes").value = '';
                document.getElementById("valueMatricula").value = '';
                document.getElementById("valueTurno").value = '';
                document.getElementById("valueCarrerasVigentes").value = '';
                document.getElementById("valuePeriodoEscolar").value = '';
                document.getElementById("valueCarrerasLiquidadas").value = '';
                document.getElementById("valueSuperficiePredio").value = '';
                document.getElementById("valueSuperficieConstruida").value = '';
                document.getElementById("valueAulasDidacticas").value = '';
                document.getElementById("valueLaboratorios").value = '';
                document.getElementById("valueBiblioteca").value = '';
                document.getElementById("valueTalleresComputo").value = '';
                document.getElementById("valueOtrosTalleres").value = '';
                document.getElementById("valueAreaAdministrativa").value = '';
                document.getElementById("valueCafeteria").value = '';
                document.getElementById("valueSalaMedios").value = '';
                document.getElementById("valueCaseta").value = '';
                document.getElementById("valueBardaPerimetral").value = '';
                document.getElementById("valueAreasDeportivas").value = '';
            }
            
            
        </script>
        
        
        <link href="../rsc/css/styleDataSheet.css" rel="stylesheet" type="text/css" /> 
    </head>
    <body>
        <div id="wrapper">
            <div id="divBody">
                <jsp:include page='<%=("" + PageParameters.getParameter("logo"))%>' />
                <div id="barMenu">
                    <jsp:include page='<%=(PageParameters.getParameter("barMenu"))%>' />
                </div>
                <p></p>
                <table width="100%" height="25px" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="64%" height="25" align="left" valign="top">
                            <a class="NVL" href="<%=PageParameters.getParameter("mainMenu")%>?<%=WebUtil.encode(session, "imix")%>=<%=WebUtil.encode(session, UTime.getTimeMilis())%>"> Menú Principal</a>
                            >
                            <a class="NVL" href="<%=PageParameters.getParameter("mainContext") + PageParameters.getParameter("gui")%>/plantelSelect.jsp?<%=WebUtil.encode(session, "imix")%>=<%=WebUtil.encode(session, UTime.getTimeMilis())%>"> Ficha Técnica</a>
                            <a>> Agregar Ficha Técnica</a>
                        </td>
                        <td width="36" align="right" valign="top">
                            <script language="JavaScript" src="<%=PageParameters.getParameter("jsRcs")%>/funcionDate.js" type="text/javascript"></script>
                        </td>
                    </tr>                        
                </table>
                <br>
                <br>
                <div id="bodyagregaFichaTecnica">
                    <form id="agregaFichaTecnica" name="agregaFichaTecnica">
                       <input type="hidden" name="FormForm" value="agregaFichaTecnica"/>
                       <input type="hidden" name="idPlantel" value="<%=WebUtil.encode(session, idPlantel) %>"/>
                        <input type="hidden" name="sesion" value="<%=WebUtil.encode(session, "imix") %>"/>
                        <legend align="center" ><%=QUID.selectNombrePlantel(idPlantel) %></legend>
                        <br>
                       <fieldset id="fieldDatosGenerales" name="fieldDatosGenerales"style="margin-left: 3%; margin-bottom: 5%; margin-right: 3%;">
                           <legend  id="tituloDatosGenerales"  align="center">Datos Generales</legend>
                        <div id="divDatosGenerales" name="divDatosGenerales">
                            <table>
                                <tr>
                                    <td> 
                                        <label id="labelNombrePlantel"class="classLabelDataSheet">Nombre del Plantel  </label>
                                        <input id="valueNombrePlantel" name="valueNombrePlantel"class="classValueDataSheet, form-control" disabled value="<%=dataPlantel.size()>0 ? dataPlantel.get(0).toString(): "" %>" title="Nombre de Plantel">                              
                                    </td>
                                    <td> 
                                        <label id="labelDireccion" class="classLabelDataSheet">Dirección</label>
                                        <input id="valueDireccion" name="valueDireccion" class="classValueDataSheet, form-control"  disabled value="<%=dataPlantel.size()>0 ? dataPlantel.get(1).toString(): "" %>" title="Dirección">                        
                                    </td>
                                   
                                </tr>
                                <tr>
                                    
                                    <td> 
                                        <label id="laberMunicipio"class="classLabelDataSheet">Municipio</label>
                                        <input id="valueMunicipio" name="valueMunicipio" class="classValueDataSheet, form-control" disabled value="<%=dataPlantel.size()>0 ? dataPlantel.get(2).toString(): "" %>" title="Municipio">                       
                                    </td>
                                    <td> 
                                        <label id="labelEstado" class="classLabelDataSheet">Estado</label>
                                        <input id="valueEstado" name="valueEstado" class="form-control" disabled value="<%=dataPlantel.size()>0 ? dataPlantel.get(3).toString(): "" %>" title="Estado">                            
                                    </td>
                                     
                                </tr>
                                <tr>
                                   
                                    <td> 
                                        <label id="labelCCT"class="classLabelDataSheet">C.C.T</label>
                                        <input id="valueCCT"  name="valueCCT" class="classValueDataSheet, form-control" disabled value="<%=dataPlantel.size()>0 ? dataPlantel.get(5).toString(): "" %>" title="Clave de Centro de Trabajo">                          
                                    </td>
                                    <td> 
                                        <label id="labelAnioCreacion" class="classLabelDataSheet">Año de Creación</label>
                                        <input id="valueAnioCreacion"  name="valueAnioCreacion" class="form-control"  disabled value="<%=dataPlantel.size()>0 ? dataPlantel.get(4).toString(): "" %>" title="Año de Creación">                     
                                    </td>
                                </tr>
                                <tr>
                                   <td> 
                                       <label id="labelTelefono" class="classLabelDataSheet">Teléfono</label>
                                       <input id="valueTelefono"  name="valueTelefono" class="classValueDataSheet, form-control" disabled value="<%=dataPlantel.size()>0 ? dataPlantel.get(6).toString(): "" %>" title="Teléfono">                         
                                    </td>
                                    <td> 
                                        <label id="labelCorreo" class="classLabelDataSheet">Correo</label>
                                        <input id="valueCorreo"  name="valueCorreo"class="form-control" disabled value="<%=dataPlantel.size()>0 ? dataPlantel.get(7).toString(): "" %>" title="Correo">                            
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td> 
                                        <label  id="labelLatitud"class="classLabelDataSheet">Latitud</label>
                                        <input id="valueLatitud"  name="valueLatitud" class="classValueDataSheet, form-control" disabled value="<%=dataPlantel.size()>0 ? dataPlantel.get(8).toString(): "" %>" title="Latitud en Grados">                         
                                    </td>
                                    <td> 
                                        <label id="labelLongitud" class="classLabelDataSheet">Longitud</label>
                                        <input id="valueLongitud"  name="valueLongitud" class="form-control"  disabled value="<%=dataPlantel.size()>0 ? dataPlantel.get(9).toString(): "" %>" title="Longitud en Grados">                              
                                    </td>
                                   
                                </tr>
                            </table>
                            
                        </div>
                            
                            </fieldset>
                        <fieldset  style="margin-left: 3%; margin-bottom: 5%; margin-right: 3%;">
                            <legend align="center">Datos Academicos</legend>
                            <div id="divDatosAcademicos" name="divDatosAcademicos">
                            <table>
                                <tr>
                                    <td colspan="3"> 
                                        <label id="labelDirector" class="classLabelDataSheet">Director</label>
                                        <input id="valueDirector"  name="valueDirector" class="classValueDataSheet, form-control" disabled value="<%=dataPlantel.size()>0 ? dataPlantel.get(10).toString(): "" %>" title="Nombre del Director">                              
                                    </td>
                                      <td> 
                                        <label id="labelPersonalAdmin" class="classLabelDataSheet">Personal Administrativo</label>
                                        <input id="valuePersonalAdmin" name="valuePersonalAdmin" class="classValueDataSheet, form-control" title="Número de Personal Administrativo">                              
                                    </td>
                                </tr>
                                <tr>
                                 
                                    <td> 
                                        <label id="labelDocentes" class="classLabelDataSheet">Docentes</label>
                                        <input id="valueDocentes" name="valueDocentes" class="classValueDataSheet, form-control" title="Número de Docentes">                              
                                    </td>
                                     <td> 
                                        <label id="labelMatricula" cclass="classLabelDataSheet">Matrícula</label>
                                        <input id="valueMatricula" name="valueMatricula" class="classValueDataSheet, form-control" title="Cantidad de Alumnos">                              
                                    </td>
                                </tr>
                                <tr>
                                    
                                    
                                   
                                     <td> 
                                        <label id="labelTurno" class="classLabelDataSheet">Turno </label>
                                        <select id="valueTurno" name="valueTurno" class="form-control" >
                                            <option value="" selected > </option>
                                            <option value="Matutino">Matutino</option>
                                            <option value="Vespertino">Vespertino</option>
                                            <option value="Matutino y Vespertino">Matutino y Vespertino</option>
                                        </select>
                                    </td>
                                    <td colspan="2"> 
                                        <label id="labelPeriodoEscolar" class="classLabelDataSheet">Periodo Escolar</label>
                                        <input id="valuePeriodoEscolar"  name="valuePeriodoEscolar" class="form-control" title="Periodo Escolar">                              
                                    </td>  
                                    
                                </tr>
                                <tr>
                                    <td  colspan="2"> 
                                        <label id="labelCarrerasVigentes" class="classLabelDataSheet">Carreras Vigentes</label>
                                        <input id="valueCarrerasVigentes" name="valueCarrerasVigentes" class="form-control" title="Describir Carreras del Plantel">                              
                                    </td>
                                    
                                                          
                                </tr>
                                <tr>
                                    <td  colspan="2"> 
                                        <label id="labelCarrerasLiquidadas" class="classLabelDataSheet">Carreras Liquidadas</label>
                                        <input id="valueCarrerasLiquidadas" name="valueCarrerasLiquidadas" class="form-control" title="Describir Carreras en Liquidación">                              
                                    </td>
                                </tr>
                               
                            </table>
                            
                        </div>
                        </fieldset>
                        <fieldset  style="margin-left: 3%; margin-bottom: 5%; margin-right: 3%;">
                            <legend align="center">Infraestructura </legend>
                            <div id="divInfraestructura" name="divInfraestructura">
                            <table>
                                 <tr style="height: 40px">
                                    <td> 
                                        <label id="labelSuperficiePredio" class="classLabelDataSheet">Superficie del Predio </label>
                                        <input id="valueSuperficiePredio" name="valueSuperficiePredio" class="form-control" title="Cantidad de Superficie">                              
                                    </td>
                                   <td> 
                                        <label id="labelSuperficieConstruida" class="classLabelDataSheet">Superficie Construida </label>
                                        <input id="valueSuperficieConstruida" name="valueSuperficieConstruida" class="form-control" title="Cantidad de Superficie Construida">                              
                                    </td>
                                    <td> 
                                        <label id="labelAulasDidacticas" class="classLabelDataSheet">Aulas Didácticas</label>
                                        <input id="valueAulasDidacticas"  name="valueAulasDidacticas" class="form-control" title="Número de Aulas Didácticas">                              
                                    </td>
                                    
                                </tr>
                                <tr style="height: 40px">
                                    
                                    <td> 
                                        <label id="labelLaboratorios" class="classLabelDataSheet">Laboratorios </label>
                                        <input id="valueLaboratorios"  name="valueLaboratorios" class="form-control" title="Número de Laboratorios">                              
                                    </td>
                                     <td> 
                                        <label id="labelBiblioteca" class="classLabelDataSheet">Biblioteca </label>
                                        <select id="valueBiblioteca" name="valueBiblioteca" class="form-control" >
                                            <option value="" selected > </option>
                                            <option value="Si">Si</option>
                                            <option value="No">No</option>
                                        </select>
                                    </td>
                                    <td> 
                                        <label id="labelTalleresComputo">Talleres de Cómputo</label>
                                        <input id="valueTalleresComputo"  name="valueTalleresComputo" class="form-control" title="Número de Talleres de Cómputo">                              
                                    </td>
                                </tr>
                                 <tr style="height: 40px">
                                    
                                    <td> 
                                        <label id="labelOtrosTalleres" class="classLabelDataSheet">Otros Talleres</label>
                                        <input id="valueOtrosTalleres"  name="valueOtrosTalleres" class="form-control" title="Describir si hay mas Talleres">                              
                                    </td>
                                    <td colspan="2"> 
                                        <label id="labelAreaAdministrativa" class="classLabelDataSheet">Área Administrativa</label>
                                        <select id="valueAreaAdministrativa" name="valueAreaAdministrativa" class="form-control">
                                            <option value="" selected > </option>
                                            <option value="Si">Si</option>
                                            <option value="No">No</option>
                                        </select>
                                    </td>
                                    
                                    </td>
                                    
                                </tr>
                                
                                <tr>
                                    <td> 
                                        <label id="labelCafeteria" class="classLabelDataSheet">Cafetería</label>
                                       <select id="valueCafeteria" name="valueCafeteria" class="form-control">
                                            <option value="" selected > </option>
                                            <option value="Si">Si</option>
                                            <option value="No">No</option>
                                        </select> 
                                    <td> 
                                        <label id="labelSalaMedios" class="classLabelDataSheet">S. Medios o AudioVisual</label>
                                          <select id="valueSalaMedios" name="valueSalaMedios" class="form-control">
                                            <option value="" selected > </option>
                                            <option value="Si">Si</option>
                                            <option value="No">No</option>
                                        </select>                                  
                                    </td>
                                    <td> 
                                        <label id="labelCaseta" class="classLabelDataSheet">Caseta de Vigilancia</label>
                                        <select id="valueCaseta" name="valueCaseta" class="form-control">
                                            <option value="" selected > </option>
                                            <option value="Si">Si</option>
                                            <option value="No">No</option>
                                        </select>                            
                                    </td> 
                                     
                                </tr>
                                 <tr style="height: 40px">
                                      <td> 
                                        <label id="labelBardaPerimetral" class="classLabelDataSheet">Barda Perimetral</label>
                                        <select id="valueBardaPerimetral" name="valueBardaPerimetral" class="form-control">
                                            <option value="" selected > </option>
                                            <option value="Si">Si</option>
                                            <option value="No">No</option>
                                        </select>    
                                    </td>
                                    <td>
                                        <label id="labelAreasDeportivas" class="classLabelDataSheet">Areas Deportivas</label>
                                        <input id="valueAreasDeportivas"  name="valueAreasDeportivas" class="form-control" title="Numero de Áreas">
                                    </td>
                                    
                                </tr>
                                <tr>
                                    
                                </tr>
                            </table>
                            
                        </div>
                        </fieldset>
                       <div id="botonEnviarDiv"  >
                           <input id="addDataSheet" type="button" class="btn btn-default" value="Guardar Ficha Técnica" name="addDataSheet" onclick="enviarInfocontroller();"/>
                           <!--<input id="addEtapasDesarrollo" type="button" class="btn btn-default" value="Agregar Etapas de Desarrollo" name="addEtapasDesarrollo" onclick="enviarInfoToAgregaEtapaDesarrollo(document.getElementById('agregaFichaTecnica'));"/>-->
                           <input id="cleanDataSheet" type="button" class="btn btn-default" value="Limpiar Ficha Técnica" name="cleanDataSheet" onclick="resetForm();"/>
                            </div> 
                       
                    </form>
                   <div id="divResult"> 
                    </div>  
                </div>
                                   
                <div id="divFoot">
                    <jsp:include page='<%=(PageParameters.getParameter("footer"))%>' />
                </div> 
            </div>
        </div>
    </body>

</html>
<%
  
    }
        
} else {
    //Mensaje de Error para permisos de acceso a la pagina.
%>                
<%@ include file="/gui/pageComponents/invalidUser.jsp"%>
<%    }
} else {
    //Mensaje de Error para sesiones caducadas 
%>
<%@ include file="/gui/pageComponents/invalidParameter.jsp"%>
<%        }
    }
} catch (Exception ex) {
    Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
    //Mensaje de Error para los errores en servidor.
%>

<%@ include file="/gui/pageComponents/handleUnExpectedError.jsp"%>
</body>
</html>
<%
        //response.sendRedirect(redirectURL);
    }
%>