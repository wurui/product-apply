<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.product-apply">
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-product-apply" ox-mod="product-apply">
            <xsl:variable name="login_uid" select="login/uid"/>
        	
        	<xsl:variable name="product" select="data/ecom-products/i[1]"/>
        	<xsl:variable name="apply" select="data/user-apply/i[target = $product/_id ]"/>

        	<xsl:choose>
        		<xsl:when test="$apply">
        			<div class="result">
	        			<div class="result-{$apply/result}"></div>
	        			
        			</div>
        		</xsl:when>
        		<xsl:otherwise>
        			<form data-target="{$product/_id}" data-title="{$product/title}">
		            	<xsl:for-each select="data/ui-fields/i">
			            	<dl class="form-section">
			            		<dt>
			            			<xsl:value-of select="name"/>
			            			<xsl:if test="required">&#160;&#160;<i class="required">*</i></xsl:if>
			            		</dt>
			            		<dd>
			            			<xsl:choose>
			            				<xsl:when test="type = 'textarea'">
			            					<textarea name="{name}"><xsl:value-of select="value"/></textarea>
			            				</xsl:when>
			            				<xsl:when test="type = 'select'">
			            					<select name="{name}">
			            						<xsl:for-each select="options/i">
			            						<option><xsl:value-of select="."/></option>
			            						</xsl:for-each>
			            					</select>
			            				</xsl:when>
			            				<xsl:when test="type = 'radio' or type = 'checkbox' ">
		            						<xsl:for-each select="options/i">
		            							<label>
		            								<input type="{../../type}" name="{../../name}" value="{.}" />
		            								<xsl:value-of select="."/>
		            							</label>
		            							&#160;&#160;&#160;&#160;
		            						</xsl:for-each>
			            				</xsl:when>
			            				<xsl:otherwise>
			            					<input class="text" type="{type}" name="{name}" placeholder="{placeholder}"/>
			            				</xsl:otherwise>
			            			</xsl:choose>
			            		</dd>
			            	</dl>
			            </xsl:for-each>
			            <div class="bottom">
			            	<button class="bt-submit skin-bgcolor">提交</button>
			            </div>
		            </form>
        			
        		</xsl:otherwise>
        	</xsl:choose>
        	
        	
        </div>
    </xsl:template>
</xsl:stylesheet>
