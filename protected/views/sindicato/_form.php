<?php
/* @var $this SindicatoController */
/* @var $model Sindicato */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'sindicato-form',
	'enableAjaxValidation'=>false,
)); 

   if($bandera==1){
               $model->telefono="";
              $model->duracion_junta_directiva="";
               $model->folio_registro="";
               $model->id="";
               $model->tomo_registroo="";
               $model->fecha_actualizacion="";
               $model->fecha_cese_vigencia="";
               $model->fecha_informe_finanzas="";
               $model->fecha_inicio_vigencia="";
               $model->fecha_ultimas_elecciones="";
               $model->fecha_nomina_afiliado="";
               $model->fecha_registro="";
               
        }
        


?>

	<p class="note">Campos con  <span class="required">*</span> son obligatorios.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'nombre'); ?>
		<?php echo $form->textField($model,'nombre',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'nombre'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'siglas'); ?>
		<?php echo $form->textField($model,'siglas',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'siglas'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'nro_boleta_inscripcion'); ?>
		<?php echo $form->textField($model,'nro_boleta_inscripcion',array('size'=>15,'maxlength'=>15, 'placeholder'=>'XXXX-XX-XXXXX')); ?>
		<?php echo $form->error($model,'nro_boleta_inscripcion'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'folio_registro'); ?>
		<?php echo $form->textField($model,'folio_registro'); ?>
		<?php echo $form->error($model,'folio_registro'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tomo_registroo'); ?>
		<?php echo $form->textField($model,'tomo_registroo',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'tomo_registroo'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'rif'); ?>
		<?php echo $form->textField($model,'rif',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'rif'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'direccion'); ?>
		<?php echo $form->textField($model,'direccion',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'direccion'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'estado'); ?>
            <?php
            echo $form->dropDownList($model, 'estado', CHtml::listData(Estados::model()->findAll(array('order' => 'estado ASC')), 'id_estado', 'estado'), array(
                'ajax' => array(
                    'type' => 'POST',
                    'url' => CController::createUrl('Sindicato/Selectmunicipio'),
                    'update' => '#' . CHtml::activeId($model, 'municipio'),
                    $text = Yii::t("app", "Seleccione una Parroquia"),
                    'beforeSend' => 'function(){ 
                       $("#Sindicato_municipio").find("option").remove();
                       $("#Sindicato_parroquia").find("option").remove();
                       
                       
                       $("#Sindicato_parroquia").append(new Option("' . $text . '",""));
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
                if($model->isNewRecord==1){
                ?>
            
            
                <?php echo $form->dropDownList($model,'municipio',array(),
                       
                        array('ajax' => array(
                    'type' => 'POST',
                    'url' => CController::createUrl('Sindicato/Selectparroquia'),
                    'update' => '#'.CHtml::activeId($model,'parroquia'),),
                            'beforeSend'=>'function(){ 
                     
                       $("#Sindicato_parroquia").find("option").remove();
                       
                       } ',
                            
                            
                            
                            'prompt' => 'Seleccione un Municipio...')
                );}
                //modificando organismo
                
                else {
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

                ?> 
            
            
            
            
		<?php echo $form->error($model,'municipio'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'parroquia'); 
                if($model->isNewRecord==1){?>
		<?php echo $form->dropDownList($model,'parroquia',
                        array(),
                        array('prompt'=>'Seleccione una Parroquia')
                     
                        ); 
                
                 } //si esta modificando
                 else{
                 $tipo=$model->municipio;
                         // Si se está modificando un registro
                         $sql="select count(id_municipio) as resultado from parroquias where id_municipio='$tipo';";
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
                         echo $form->dropDownList($model,'parroquia',
                         array('0' => 'Seleccione una  Parroquia')); }
                         // Si el tipo de organismo no tiene ningún
                         else {
                         // organismo solo muestra Seleccione un Organismo
                         echo $form->dropDownList($model,'parroquia',
                         CHtml::listData(Parroquias::model()->findAllBySql(
                         //Aquí van los datos de la búsqueda del segundo combo
                         "select * from parroquias where id_municipio
                         =:keyword order by id_parroquia=:clave2 asc",
                         array(':keyword'=>$model->municipio,':clave2'=>$model->municipio)),
                         'id_parroquia','parroquia'));
                         }
                
                
                 }
                ?>
		
		<?php echo $form->error($model,'parroquia'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'telefono'); ?> 
                <?php if($model->isNewRecord){
                    $model->telefono="";
                 ?>
		<?php echo CHtml::activetextField($model,'telefono',array('size'=>20,'maxlength'=>50, 'placeholder'=>'Eje: 0212-1234567', 'name'=>'telefono[]'));
// echo $form->textField($model,'telefono',array('size'=>20,'maxlength'=>50));
                ?>&nbsp;&nbsp;&nbsp; 
                <?php  echo CHtml::activetextField($model,'telefono',array('size'=>20,'maxlength'=>50, 'placeholder'=>'Eje: 0212-1234567', 'name'=>'telefono[]')); ?>
               <?php }else{
                   
               $telefono = explode("/", $model->telefono);
               ?>
                
               <?php echo CHtml::activetextField($model,'telefono',array('size'=>20,'maxlength'=>50, 'placeholder'=>'Eje: 0212-1234567', 'name'=>'telefono[]', 'value'=>$telefono[0]));
// echo $form->textField($model,'telefono',array('size'=>20,'maxlength'=>50));
                ?>&nbsp;&nbsp;&nbsp; 
               <?php  echo CHtml::activetextField($model,'telefono',array('size'=>20,'maxlength'=>50, 'placeholder'=>'Eje: 0212-1234567', 'name'=>'telefono[]','value'=>!empty($telefono[1]) ? $telefono[1]: '')); }?> 
                
                
                
                
                
               <?php echo $form->error($model,'telefono'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'federacion_nacional'); ?>
		<?php echo $form->textField($model,'federacion_nacional',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'federacion_nacional'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'federacion_regional'); ?>
		<?php echo $form->textField($model,'federacion_regional',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'federacion_regional'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'sector'); ?>
                <?php echo $form->dropDownList($model,'sector',
                        CHtml::listData(Sector::model()->findAll(array('order'=>'id ASC')),'id','nombre'),
                        array(
                    'ajax' => array(
                    'type' => 'POST',
                                ),'prompt' => 'Seleccione un Sector...',
            )
                ); ?>
            
            
            
		<?php echo $form->error($model,'sector'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'ambito'); ?>
		 <?php echo $form->dropDownList($model,'ambito',
                        CHtml::listData(Ambito::model()->findAll(array('order'=>'id ASC')),'id','nombre_ambito'),
                        array(
                    'ajax' => array(
                    'type' => 'POST',
                                ),'prompt' => 'Seleccione un Ambito...',
            )
                ); ?>
		<?php echo $form->error($model,'ambito'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tipo_organizacion'); ?>
		 <?php echo $form->dropDownList($model,'tipo_organizacion',
                        CHtml::listData(Tipo_orgaizacion::model()->findAll(array('order'=>'id ASC')),'id','descripcion'),
                        array(
                    'ajax' => array(
                    'type' => 'POST',
                                ),'prompt' => 'Seleccione un tipo de organización...',
            )
                ); ?>
                
            
		<?php echo $form->error($model,'tipo_organizacion'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fecha_registro'); ?>
		<?php 
                $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model'=>$model,
                'attribute'=>'fecha_registro',
                'value'=>$model->fecha_registro,
                'language' => 'es',
                'htmlOptions' => array('readonly'=>"readonly",),
                'options'=>array(
                'autoSize'=>true,
                'defaultDate'=>$model->fecha_registro,
                'dateFormat'=>'yy-mm-dd',
                
                'buttonImage'=>Yii::app()->baseUrl.'/images/calendario.jpg',
                'buttonImageOnly'=>true,
               
                'selectOtherMonths'=>true,
                'showAnim'=>'slide',
                'showButtonPanel'=>true,
                'showOn'=>'button', 
                'showOtherMonths'=>true, 
                'changeMonth' => 'true', 
                'changeYear' => 'true', 
                'minDate'=>'-20Y', 
                'maxDate'=> "+10Y",
                ),
                )); 
                    ?>
                    
                    
		<?php echo $form->error($model,'fecha_registro'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fecha_actualizacion'); ?>
		<?php 
                $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model'=>$model,
                'attribute'=>'fecha_actualizacion',
                'value'=>$model->fecha_actualizacion,
                'language' => 'es',
                'htmlOptions' => array('readonly'=>"readonly",),
                'options'=>array(
                'autoSize'=>true,
                'defaultDate'=>$model->fecha_actualizacion,
                'dateFormat'=>'yy-mm-dd',
                
                'buttonImage'=>Yii::app()->baseUrl.'/images/calendario.jpg',
                'buttonImageOnly'=>true,
               
                'selectOtherMonths'=>true,
                'showAnim'=>'slide',
                'showButtonPanel'=>true,
                'showOn'=>'button', 
                'showOtherMonths'=>true, 
                'changeMonth' => 'true', 
                'changeYear' => 'true', 
                'minDate'=>'-20Y', 
                'maxDate'=> "+10Y",
                ),
                )); 
                    ?>
		<?php echo $form->error($model,'fecha_actualizacion'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'duracion_junta_directiva'); ?>
		<?php echo $form->textField($model,'duracion_junta_directiva'); ?>
		<?php echo $form->error($model,'duracion_junta_directiva'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fecha_inicio_vigencia'); ?>
		<?php 
                $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model'=>$model,
                'attribute'=>'fecha_inicio_vigencia',
                'value'=>$model->fecha_inicio_vigencia,
                'language' => 'es',
                'htmlOptions' => array('readonly'=>"readonly",),
                'options'=>array(
                'autoSize'=>true,
                'defaultDate'=>$model->fecha_inicio_vigencia,
                'dateFormat'=>'yy-mm-dd',
                
                'buttonImage'=>Yii::app()->baseUrl.'/images/calendario.jpg',
                'buttonImageOnly'=>true,
               
                'selectOtherMonths'=>true,
                'showAnim'=>'slide',
                'showButtonPanel'=>true,
                'showOn'=>'button', 
                'showOtherMonths'=>true, 
                'changeMonth' => 'true', 
                'changeYear' => 'true', 
                'minDate'=>'-20Y', 
                'maxDate'=> "+10Y",
                ),
                )); 
                    ?>
		<?php echo $form->error($model,'fecha_inicio_vigencia'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fecha_cese_vigencia'); ?>
		<?php 
                $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model'=>$model,
                'attribute'=>'fecha_cese_vigencia',
                'value'=>$model->fecha_cese_vigencia,
                'language' => 'es',
                'htmlOptions' => array('readonly'=>"readonly",),
                'options'=>array(
                'autoSize'=>true,
                'defaultDate'=>$model->fecha_cese_vigencia,
                'dateFormat'=>'yy-mm-dd',
                
                'buttonImage'=>Yii::app()->baseUrl.'/images/calendario.jpg',
                'buttonImageOnly'=>true,
               
                'selectOtherMonths'=>true,
                'showAnim'=>'slide',
                'showButtonPanel'=>true,
                'showOn'=>'button', 
                'showOtherMonths'=>true, 
                'changeMonth' => 'true', 
                'changeYear' => 'true', 
                'minDate'=>'-20Y', 
                'maxDate'=> "+10Y",
                ),
                )); 
                    ?>
		<?php echo $form->error($model,'fecha_cese_vigencia'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fecha_informe_finanzas'); ?>
		<?php 
                $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model'=>$model,
                'attribute'=>'fecha_informe_finanzas',
                'value'=>$model->fecha_informe_finanzas,
                'language' => 'es',
                'htmlOptions' => array('readonly'=>"readonly",),
                'options'=>array(
                'autoSize'=>true,
                'defaultDate'=>$model->fecha_informe_finanzas,
                'dateFormat'=>'yy-mm-dd',
                
                'buttonImage'=>Yii::app()->baseUrl.'/images/calendario.jpg',
                'buttonImageOnly'=>true,
               
                'selectOtherMonths'=>true,
                'showAnim'=>'slide',
                'showButtonPanel'=>true,
                'showOn'=>'button', 
                'showOtherMonths'=>true, 
                'changeMonth' => 'true', 
                'changeYear' => 'true', 
                'minDate'=>'-20Y', 
                'maxDate'=> "+10Y",
                ),
                )); 
                    ?>
		<?php echo $form->error($model,'fecha_informe_finanzas'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fecha_nomina_afiliado'); ?>
		<?php 
                $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model'=>$model,
                'attribute'=>'fecha_nomina_afiliado',
                'value'=>$model->fecha_nomina_afiliado,
                'language' => 'es',
                'htmlOptions' => array('readonly'=>"readonly",),
                'options'=>array(
                'autoSize'=>true,
                'defaultDate'=>$model->fecha_nomina_afiliado,
                'dateFormat'=>'yy-mm-dd',
                
                'buttonImage'=>Yii::app()->baseUrl.'/images/calendario.jpg',
                'buttonImageOnly'=>true,
               
                'selectOtherMonths'=>true,
                'showAnim'=>'slide',
                'showButtonPanel'=>true,
                'showOn'=>'button', 
                'showOtherMonths'=>true, 
                'changeMonth' => 'true', 
                'changeYear' => 'true', 
                'minDate'=>'-20Y', 
                'maxDate'=> "+10Y",
                ),
                )); 
                    ?>
		<?php echo $form->error($model,'fecha_nomina_afiliado'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fecha_ultimas_elecciones'); ?>
		<?php 
                $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model'=>$model,
                'attribute'=>'fecha_ultimas_elecciones',
                'value'=>$model->fecha_ultimas_elecciones,
                'language' => 'es',
                'htmlOptions' => array('readonly'=>"readonly",),
                'options'=>array(
                'autoSize'=>true,
                'defaultDate'=>$model->fecha_ultimas_elecciones,
                'dateFormat'=>'yy-mm-dd',
                
                'buttonImage'=>Yii::app()->baseUrl.'/images/calendario.jpg',
                'buttonImageOnly'=>true,
               
                'selectOtherMonths'=>true,
                'showAnim'=>'slide',
                'showButtonPanel'=>true,
                'showOn'=>'button', 
                'showOtherMonths'=>true, 
                'changeMonth' => 'true', 
                'changeYear' => 'true', 
                'minDate'=>'-20Y', 
                'maxDate'=> "+10Y",
                ),
                )); 
                    ?>
		<?php echo $form->error($model,'fecha_ultimas_elecciones'); ?>
	</div>

	<div class="row">
		
		<div class="row">
		
                <?php if(isset($_GET['convencion'])){ ?>
                <?php echo $form->HiddenField($model,'cod_convencion',array('size'=>50,'maxlength'=>50, 'value'=>$_GET['convencion'])); }?>
		
	</div>

	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Crear' : 'Salvar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->