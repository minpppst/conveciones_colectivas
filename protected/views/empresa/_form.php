<?php
/* @var $this EmpresaController */
/* @var $model Empresa */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'empresa-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Los Campos con <span class="required">*</span> son obligatorios.</p>

	<?php echo $form->errorSummary($model); ?>
        <?php  if($bandera==1){
               $model->telefono="";
               $model->fax="";
               $model->correo="";
               $model->web="";
               $model->id="";
               $model->nro_sucursales="";
             echo CHtml::hiddenField('empresarelacional', '1', array('id'=>'empresarelacional'));
        }
        ?>
	<div class="row">
		<?php echo $form->labelEx($model,'razon_social'); ?>
		<?php echo $form->textField($model,'razon_social',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'razon_social'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'rif'); ?>
		<?php echo $form->textField($model,'rif',array('size'=>20,'maxlength'=>20, 'placeholder'=>'Eje: V12345678-9')); ?>
		<?php echo $form->error($model,'rif'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'identificacion_laboral'); ?>
		<?php echo $form->textField($model,'identificacion_laboral',array('size'=>15,'maxlength'=>15, 'placeholder'=>'Eje: 123456-1..')); ?>
		<?php echo $form->error($model,'identificacion_laboral'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'seguro_social'); ?>
		<?php echo $form->textField($model,'seguro_social',array('size'=>10,'maxlength'=>10)); ?>
		<?php echo $form->error($model,'seguro_social'); ?>
	</div>

	<div class="row">
                                         <script>
                                         function llenarcampos(){

                                             var dato=$("#Empresa_actividad_economica").val();
                                             $.ajax({
                                             type : 'POST',
                                             data:{"datos":dato},
                                             url: <?php echo "'".CController::createUrl('Empresa/LlenarCampos')."'"; ?>
                                              })
                                              .done(function( result ) {  

                                              $('#seccion').html(result);
                                              });
                                              }
                                          
      
                                         </script>
                                         <label id="seccion"></label>
                                         </div>

        <div class="row">
               
        <!--Aqui Comienza el autocomplete-->
                
        <div class="input-append">
             
        <?php
      if($model->isNewRecord==1){
      echo $form->labelEx($model,'actividad_economica');
      echo CHtml::hiddenField('Empresa[actividad_economica]',$model->actividad_economica);
        
      $this->widget('zii.widgets.jui.CJuiAutoComplete', array(
            'name'=>'searchbox',
            'value'=>'',
            'source'=>CController::createUrl('/Empresa/AutoComplete'),
            'options'=>array(
            'showAnim'=>'fold',         
            'minLength'=>'2',
             
              
            'select'=>'js:function( event, ui ) {
                        $("#searchbox").val( ui.item.label );
                        $("#Empresa_actividad_economica").val( ui.item.value );
                        return false;
                  }',
            ),
            'htmlOptions'=>array(
            'onfocus' => 'js: this.value = null; $("#Empresa[actividad_economica]").val(null); $("#Empresa_actividad_economica").val(null);',
            'class' => 'input-xxlarge search-query',
            'placeholder' => "Buscar...",
            'onblur'=>'js: llenarcampos();',
            'style' => 'width: 385px; ',
            ),
            ));
        }else{
               $tipo=$model->actividad_economica;
                         // Si se está modificando un registro
                         $sql="select count(id) as resultado,rama as resultado1 from rama where id='$tipo';";
                         //
                         $connection=Yii::app()->db;
                         //
                         $command=$connection->createCommand($sql);
                         //
                         $row=$command->queryRow();
                         //
                         $bandera=$row['resultado'];
                         //
                         if ($bandera==0) {
                         //
                         echo $form->labelEx($model,'actividad_economica');
                         // Si el tipo de organismo no tiene ningún
                         } else {
                         // organismo solo muestra Seleccione un Organismo
                         echo  "<pre><b>Actividad Economica De La Empresa:</b>".$row['resultado1']." "; 
                        
                         }  echo $form->labelEx($model,'actividad_economica');
                           echo $form->hiddenField($model,'actividad_economica',array('value'=>$model->actividad_economica,));
                    $this->widget('zii.widgets.jui.CJuiAutoComplete', array(
                    'name'=>'searchbox',
                    'value'=>'',
                    'source'=>CController::createUrl('/Empresa/AutoComplete'),
                    'options'=>array(
                    'showAnim'=>'fold',         
                    'minLength'=>'2',


                    'select'=>'js:function( event, ui ) {
                                $("#searchbox").val( ui.item.label );
                                $("#Empresa_actividad_economica").val( ui.item.value );
                                return false;
                          }',
                    ),
                    'htmlOptions'=>array(
                    'onfocus' => 'js: this.value = null; $("#Empresa[actividad_economica]").val(null); $("#Empresa_actividad_economica").val(null);',
                    'class' => 'input-xxlarge search-query',
                    'placeholder' => "Buscar...",
                    'onblur'=>'js: llenarcampos();',
                    'style' => 'width: 385px; ',
                    ),
                    ));
                    }
            
             
                 
             
        ?>
        </div>
        </div>

	<div class="row">
		<?php echo $form->labelEx($model,'sector'); 
		
                echo $form->dropDownList($model, 'sector', CHtml::listData(Sector::model()->findAll(
                        array(
                            'order' => 'nombre ASC')), 'id', 'nombre'), 
                        array(
                            'prompt' => 'Seleccione un Sector...',
                        )
            );
            ?>
            <?php echo $form->error($model,'sector'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'capital_empresa'); ?>
		<?php echo $form->textField($model,'capital_empresa',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'capital_empresa'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'nro_sucursales'); ?>
		<?php echo $form->textField($model,'nro_sucursales'); ?>
		<?php echo $form->error($model,'nro_sucursales'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'direccion'); ?>
		<?php echo $form->textField($model,'direccion',array('size'=>60,'maxlength'=>400, 'placeholder'=>'Urb. Calle, Edif./Casa')); ?>
		<?php echo $form->error($model,'direccion'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'estado'); ?>
            <?php
            echo $form->dropDownList($model, 'estado', CHtml::listData(Estados::model()->findAll(array('order' => 'estado ASC')), 'id_estado', 'estado'), array(
                'ajax' => array(
                    'type' => 'POST',
                    'url' => CController::createUrl('Empresa/Selectmunicipio'),
                    'update' => '#' . CHtml::activeId($model, 'municipio'),
                    $text = Yii::t("app", "Seleccione una Parroquia"),
                    'beforeSend' => 'function(){ 
                       $("#Empresa_municipio").find("option").remove();
                       $("#Empresa_parroquia").find("option").remove();
                       
                       
                       $("#Empresa_parroquia").append(new Option("' . $text . '",""));
                       } ',
                //$("#TblMunicipio_id").find("option").remove();
                ), 'prompt' => 'Seleccione un Estado...',
                    )
            );
            ?>
            
            
		<?php echo $form->error($model,'estado'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'municipio'); ?>
               <?php //si esta creando municipio
               // if($model->isNewRecord==1){
                ?>
            
            
                <?php 
                
                if ($model->estado == 0 || $model->estado == '') {

                        echo $form->dropDownList($model,'municipio',array(),
                       
                        array('ajax' => array(
                    'type' => 'POST',
                    'url' => CController::createUrl('Empresa/Selectparroquia'),
                    'update' => '#'.CHtml::activeId($model,'parroquia'),),
                            'beforeSend'=>'function(){ 
                     
                       $("#Empresa_parroquia").find("option").remove();
                       
                       } ',
                            
                            
                            
                            'prompt' => 'Seleccione un Municipio...')
                );}
                else{
                    $list = Municipios::model()->findALL(array('condition'=>"id_estado=$model->estado"));
                    $niveles=CHtml::listData($list,'id_municipio','municipio');  
                    echo $form->dropDownList($model,'municipio',$niveles,
                       
                        array('ajax' => array(
                    'type' => 'POST',
                    'url' => CController::createUrl('Empresa/Selectparroquia'),
                    'update' => '#'.CHtml::activeId($model,'parroquia'),),
                            'beforeSend'=>'function(){ 
                     
                       $("#Empresa_parroquia").find("option").remove();
                       
                       } ',
                            
                            
                            
                            'prompt' => 'Seleccione un Municipio...')
                );
                    
                    
                }
               // }
                //modificando organismo
                
               /* else {
                         $tipo=$model->estado;
                         // Si se está modificando un registro
                         $sql="select count(id_municipio) as resultado from municipios where id_estado='$tipo';";
                         //
                         $connection=Yii::app()->db;
                         //
                         $command=$connection->createCommand($sql);
                         //
                         $row=$command->queryRow();
                         //
                         $bandera=$row['resultado'];
                         //
                         if ($bandera==0) {
                         //
                         echo $form->dropDownList($model,'municipio',
                         array('0' => 'Seleccione un Municipio')); }
                         // Si el tipo de organismo no tiene ningún
                         else {
                         // organismo solo muestra Seleccione un Organismo
                         echo $form->dropDownList($model,'municipio',
                         CHtml::listData(Municipios::model()->findAllBySql(
                         //Aquí van los datos de la búsqueda del segundo combo
                         "select * from municipios where id_estado
                         =:keyword order by id_estado=:clave2 asc",
                         array(':keyword'=>$model->estado,':clave2'=>$model->estado)),
                         'id_municipio','municipio'));
                         }
                         }    
*/
                ?> 
            
            
            
            
		<?php echo $form->error($model,'municipio'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'parroquia'); 
                
                if ($model->municipio == 0 || $model->municipio == '') {
                        echo $form->dropDownList($model,'parroquia',
                        array(),
                        array('prompt'=>'Seleccione una Parroquia')
                     
                        ); 
                }else{
                        $list = Parroquias::model()->findALL(array('condition'=>"id_municipio=$model->municipio"));
                        $niveles=CHtml::listData($list,'id_parroquia','parroquia');  
                        echo $form->dropDownList($model,'parroquia',
                        $niveles,
                        array('prompt'=>'Seleccione una Parroquia')
                        ); 
                }
                
                 
                ?>
		
		<?php echo $form->error($model,'parroquia'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'telefono'); ?> 
                <?php if($model->isNewRecord){
                     $telefono = explode("/", $model->telefono);
                    $model->telefono="";
                 ?>
		<?php echo CHtml::activetextField($model,'telefono',array('size'=>20,'maxlength'=>50, 'placeholder'=>'Eje: 0212-1234567', 'name'=>'telefono[]', 'value'=>$telefono[0]));
// echo $form->textField($model,'telefono',array('size'=>20,'maxlength'=>50));
                ?>&nbsp;&nbsp;&nbsp; 
                <?php  echo CHtml::activetextField($model,'telefono',array('size'=>20,'maxlength'=>50, 'placeholder'=>'Eje: 0212-1234567', 'name'=>'telefono[]', 'value'=>!empty($telefono[1]) ? $telefono[1]: '')); ?>
               <?php }else{
                   
               $telefono = explode("/", $model->telefono);
               ?>
                
               <?php echo CHtml::activetextField($model,'telefono',array('size'=>20,'maxlength'=>50, 'placeholder'=>'Eje: 0212-1234567', 'name'=>'telefono[]', 'value'=>$telefono[0]));
// echo $form->textField($model,'telefono',array('size'=>20,'maxlength'=>50));
                ?>&nbsp;&nbsp;&nbsp; 
               <?php  echo CHtml::activetextField($model,'telefono',array('size'=>20,'maxlength'=>50, 'placeholder'=>'Eje: 0212-1234567', 'name'=>'telefono[]','value'=>!empty($telefono[1]) ? $telefono[1]: '')); 
               
               }?> 
                
                
                
                
                
               <?php echo $form->error($model,'telefono'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fax'); ?>
		<?php echo $form->textField($model,'fax',array('size'=>20,'maxlength'=>20, 'placeholder'=>'Eje: 0212-1234567')); ?>
		<?php echo $form->error($model,'fax'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'correo'); ?>
		<?php echo $form->textField($model,'correo',array('size'=>60,'maxlength'=>100, 'placeholder'=>'ejemplo@ejemplo.com')); ?>
		<?php echo $form->error($model,'correo'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'web'); ?>
		<?php echo $form->textField($model,'web',array('size'=>50,'maxlength'=>50, 'placeholder'=>'http://ejemplo.com/')); ?>
		<?php echo $form->error($model,'web'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'rnc'); ?>
		<?php echo $form->textField($model,'rnc',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'rnc'); ?>
	</div>

	<div class="row">
		
                <?php if(isset($_GET['convencion'])){ ?>
                <?php echo $form->HiddenField($model,'cod_convencion',array('size'=>50,'maxlength'=>50, 'value'=>$_GET['convencion'])); }?>
		
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Crear' : 'Salvar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->