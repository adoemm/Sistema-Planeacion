<%-- 
    Document   : consultaEtapaDesarrollo
    Created on : Oct 25, 2016, 10:22:37 AM
    Author     : emmanuel
--%>

<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" language="java"%>
 <link href="../rsc/css/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> 
<%@ include file="/gui/pageComponents/globalSettings.jsp"%>
<%    try {
        if (fine) {
            
            if (request.getParameter(WebUtil.encode(session, "imix")) != null) {
                String access4ThisPage = "viewStage";
                LinkedList<String> userAccess = (LinkedList<String>) session.getAttribute("userAccess");
                if (UserUtil.isAValidUser(access4ThisPage, userAccess)) {
                    if (PageParameters.getParameter("SiteOnMaintenance").equals("true")) {
                        String redirectURL = "" + PageParameters.getParameter("mainController") + "?exit=1";
                        response.sendRedirect(redirectURL);
                    } else {
                         Iterator it = null;
                         
                        int idPlantel= Integer.parseInt(WebUtil.decode(session, request.getParameter("idPlantel")));
                             
%>


<!DOCTYPE html>
<html>
    <head>
        
        <title>Etapas de Desarrollo</title>
        <jsp:include page='<%=PageParameters.getParameter("globalLibs")%>'/>
        <script type="text/javascript" language="javascript" charset="utf-8">
            window.history.forward();
            function noBack() {
                window.history.forward();
            }
            function enviarInfocontroller (idEtapa, flagActividades)
            {
                if(flagActividades ===true)
                   {
                        $.msgBox({
                    title: "Advertencia",
                    content: "Hay Actividades en esta Etapa, ¿Continuar con la Eliminación de la Etapa",
                    //info
                    //confirm
                    //error
                    type: "confirm",
                    opacity: 0.75,
                    buttons: [{value: "SI"},{value: "NO"}],
                    success : function (result)
                    {
                        if(result === 'SI'){
                         
             $.ajax({type: 'POST'
                    , contentType: 'application/x-www-form-urlencoded;charset=utf-8'
                    , cache: false
                    , async: false
                    , url: '<%=PageParameters.getParameter("mainController")%>'
                    , data: $('#form').serialize()+'&idEtapa='+idEtapa
                    , success: function (response) {
                        $('#wrapper').find('#divResult').html(response);
                    }});
            
            
                        }
                    }
                   
                });
                   }else
                   {
                        $.msgBox({
                    title: "Advertencia",
                    content: "¿Eliminar Etapa?",
                    //info
                    //confirm
                    //error
                    type: "confirm",
                    opacity: 0.75,
                    buttons: [{value: "SI"},{value: "NO"}],
                    success : function (result)
                    {
                        if(result === 'SI'){
                         
             $.ajax({type: 'POST'
                    , contentType: 'application/x-www-form-urlencoded;charset=utf-8'
                    , cache: false
                    , async: false
                    , url: '<%=PageParameters.getParameter("mainController")%>'
                    , data: $('#form').serialize()+'&idEtapa='+idEtapa
                    , success: function (response) {
                        $('#wrapper').find('#divResult').html(response);
                    }});
            
            
                        }
                    }
                   
                });
                   }
                   
                  
               
            }
            function popupArchivos(idObjeto) {
                newwindow = window.open(
                        '<%=PageParameters.getParameter("mainContext") + PageParameters.getParameter("gui")%>/Insert_ObjetoArchivo.jsp?<%=WebUtil.encode(session, "imix")%>=<%=WebUtil.encode(session, UTime.getTimeMilis())%>&idObjeto=' + idObjeto + '&nombreObjeto=<%=WebUtil.encode(session, "ETAPA")%>&FormFrom=file4Etapa'
                        , 'Archivos'
                        , 'width=' + (screen.availWidth).toString() + ',height=' + (screen.availHeight).toString() + ',toolbar=0,menubar=0,resizable=1,scrollbars=1,status=1,location=0,directories=0,top=50'
                        );
                if (window.focus) {
                    newwindow.focus();
                }
            }
            
             
        </script>
        <%@ include file="/gui/pageComponents/dataTablesFullFunctionParameters.jsp"%>
    </head>
    <body  onload="cargaTabla();">
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
                            >
                            <a> Consulta Etapas</a>
                        </td>
                        <td width="36" align="right" valign="top">
                            <script language="JavaScript" src="<%=PageParameters.getParameter("jsRcs")%>/funcionDate.js" type="text/javascript"></script>
                        </td>
                    </tr>                        
                </table>
                <br>
                <br>
                <div id="contenent_info">
                           <form name="form" method="post" action="" enctype="application/x-www-form-urlencoded" id="form">
                               <input type="hidden" name="FormForm" value="eliminaStage"/>
                               <input type="hidden" name="idPlantel" value="<%=WebUtil.encode(session, idPlantel) %>"/>
                               <input type="hidden" name="sesion" value="<%=WebUtil.encode(session, "imix") %>"/>
                       
                               
                               <legend align="center" ><%=QUID.selectNombrePlantel(idPlantel) %></legend>
                        <br>
                            <fieldset>
                                <legend align="center">Etapas de Desarrollo</legend>
                                <div style="margin-left: 2%; margin-right: 2%; font-size: 12px; ">
                                    <table border="0" width="100%" cellpadding="0" cellspacing="0" style="text-align: left" class="display" id="example">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center">N° Etapa</th>
                                            <th style="text-align: center">Año Construcción</th>
                                            <th style="text-align: center">Nombre Etapa</th>
                                            <th style="text-align: center">Descripcción</th>
                                            <th style="text-align: center">Status</th>
                                            <th style="text-align: center">Avance %</th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center">
                                    </tbody>
                                </table>
                                </div>
                                
                            </fieldset>
                        </form>
                </div>
                <br>
                <br>
                <div id="botonEnviarDiv"  style="margin-left: 5%">
                          
                    <a href="<%=PageParameters.getParameter("mainContext") + PageParameters.getParameter("gui")%>/agregaEtapaDesarrollo.jsp?<%=WebUtil.encode(session, "imix")%>=<%=WebUtil.encode(session, UTime.getTimeMilis())%>&<%=WebUtil.encode(session, "idPlantel") %>=<%=request.getParameter("idPlantel")%>">
                               <button class="btn btn-default">Agregar Etapa de Desarrollo</button>
                           </a>
                          
                            </div> 
                               <div id="divResult"></div>
                 <div id="divFoot">
                    <jsp:include page='<%=(PageParameters.getParameter("footer"))%>' />
                </div> 
                <script type="text/javascript" language="javascript" charset="utf-8">
        function cargaTabla()
        {
            var t = $('#example').dataTable();
            t.fnClearTable();
            var data = new Array();
            var ids = new Array();
            var cells = new Array();

                    <%
                        LinkedList listAux= new LinkedList();
                        int cont = 0;
                        it = QUID.selectEtapasDesarrollo(idPlantel).iterator();
                        while (it.hasNext()) {
                            listAux = (LinkedList) it.next();
                    %>
            ids[<%=cont%>] = '<%=listAux.get(0)%>';
            cells[0] = '<%=listAux.get(6).toString()%>';
            cells[1] = '<%=listAux.get(1).toString()%>';
            cells[2] = '<%=listAux.get(2).toString()%>';
            cells[3] = '<%=listAux.get(3).toString()%>';
            cells[4] = '<%=listAux.get(4).toString()%>';
            cells[5] = '<%=listAux.get(5).toString()%>';
            cells[6] = '<button style="background: transparent; border: 0px;"> <img src="<%=PageParameters.getParameter("imgRsc")%>/icons/Gnome-Mail-Attachment-64.png" onclick="popupArchivos(\'<%=WebUtil.encode(session, listAux.get(0))%>\');"  title="Actividades" width="22" height="23" alt="Archivos" O></button>';
            cells[7] = '<a href="<%=PageParameters.getParameter("mainContext") + PageParameters.getParameter("gui")%>/modificaEtapa.jsp?<%=WebUtil.encode(session, "imix")%>=<%=WebUtil.encode(session, UTime.getTimeMilis())%>&idPlantel=<%=WebUtil.encode(session, idPlantel)%>&idEtapa=<%=WebUtil.encode(session, listAux.get(0))%>"><img src="<%=PageParameters.getParameter("imgRsc")%>/icons/Gnome-Accessories-Text-Editor-64.png" title="Modifica Etapa" width="22" height="23" alt="Modifica Etapa"></a>';
            cells[8] = '<button style="background: transparent; border: 0px;"> <a onclick="enviarInfocontroller(<%=Integer.parseInt(listAux.get(0).toString()) %>,<%=QUID.selectActivitiesOfStage(Integer.parseInt(listAux.get(0).toString()))%>);"><img src="<%=PageParameters.getParameter("imgRsc")%>/icons/Gnome-Process-Stop-64.png" title="Eliminar" width="22" height="23" alt="Eliminar Etapa"></a></button> ';
            
            data[<%=cont%>] = t.fnAddData(cells, false);
                    <%
                            cont++;
                        }
                    %>

            $("tfoot th").each(function (i) {
                this.innerHTML = fnCreateSelect(t.fnGetColumnData(i));
                $('select', this).change(function () {
                    t.fnFilter($(this).val(), i);
                });
            });
            t.fnDraw();
            document.getElementById('contenent_info').style.display = 'block';
        }
                </script>
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
