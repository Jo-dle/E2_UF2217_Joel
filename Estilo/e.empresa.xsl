<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <html>
        <head>
            <title>Registro de Personal</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
        </head>
        <body class="container mt-4">
            <h1 class="text-center mb-4">Registro de Personal</h1>

            <!-- Empleados -->
            <h2>Empleados</h2>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Sexo</th>
                        <th>Email</th>
                        <th>Teléfono</th>
                        <th>Departamento</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="registroPersonal/empleados/empleado">
                        <tr>
                            <td><xsl:value-of select="@CED"/></td>
                            <td><xsl:value-of select="nombre"/></td>
                            <td><xsl:value-of select="sexo"/></td>
                            <td><xsl:value-of select="contacto/email"/></td>
                            <td><xsl:value-of select="contacto/telefono"/></td>
                            <td><xsl:value-of select="departamento"/></td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>

            <!-- Consultores -->
            <h2>Consultores</h2>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Sexo</th>
                        <th>Email</th>
                        <th>Teléfono</th>
                        <th>Departamento</th>
                        <th>Empresa Externa</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="registroPersonal/consultores/consultor">
                        <tr>
                            <td><xsl:value-of select="@CCD"/></td>
                            <td><xsl:value-of select="nombre"/></td>
                            <td><xsl:value-of select="sexo"/></td>
                            <td><xsl:value-of select="contacto/email"/></td>
                            <td><xsl:value-of select="contacto/telefono"/></td>
                            <td><xsl:value-of select="departamento"/></td>
                            <td><xsl:value-of select="empresaExterna"/></td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>

            <!-- Departamentos -->
            <h2>Departamentos</h2>
            <xsl:for-each select="registroPersonal/departamentos/departamento">
                <div class="card mb-3">
                    <div class="card-header bg-primary text-white">
                        <strong><xsl:value-of select="nombre"/></strong> - Director: <xsl:value-of select="director"/>
                    </div>
                    <div class="card-body">
                        <p><strong>Dirección:</strong></p>
                        <ul>
                            <li>Calle: <xsl:value-of select="direccion/calle"/></li>
                            <li>Ciudad: <xsl:value-of select="direccion/ciudad"/></li>
                            <li>Código Postal: <xsl:value-of select="direccion/codigoPostal"/></li>
                        </ul>
                        <p><strong>Empleados:</strong></p>
<ul>
    <xsl:for-each select="empleados/empleado">
        <xsl:variable name="ced" select="@CED"/>
        <xsl:for-each select="/registroPersonal/empleados/empleado[@CED=$ced]">
            <li>
                <xsl:value-of select="nombre"/> (<xsl:value-of select="@CED"/>)
            </li>
        </xsl:for-each>
    </xsl:for-each>
</ul>

                    </div>
                </div>
            </xsl:for-each>

        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
