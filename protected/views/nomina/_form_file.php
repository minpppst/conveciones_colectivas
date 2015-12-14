<?php
/* @var $this NominaController */
/* @var $model Nomina */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'nomina_form_file',
	'enableAjaxValidation'=>false,
    
    'htmlOptions'=>array(
        'enctype'=>'multipart/form-data'
    )
)); ?>
    
    
    
    
    <?php //echo $form->errorSummary($model); ?>
	 <div id="statusMsg">
<?php if(Yii::app()->user->getFlash('error')):?>
    <div class="flash-error">
        <?php echo Yii::app()->user->getFlash('error'); ?>
    </div>
<?php endif; ?>
</div>
	 <div class="row">
	  <?php echo $form->labelEx($model,'csvfile'); ?>
	        <?php
	            $this->widget('CMultiFileUpload', array(
	                'model'=>$model,
	                'name' => 'csvfile',
	                'max'=>1,
	                'accept' => 'csv',
	                'duplicate' => 'Duplicate file!',
	                'denied' => 'Invalid file type',             
	            ));
                    
                    
	        ?>
	  <?php echo $form->error($model,'csvfile'); ?>
	 </div>
    <div class="row">
        <?php echo $form->labelEx($model,'id_empresa'); ?>
        
	<?php           $list = Empresa::model()->findALL(array('condition'=>"cod_convencion=$_GET[convencion]"));
                        $niveles=CHtml::listData($list,'id','razon_social');  
                        echo $form->dropDownList($model,'id_empresa',
                        $niveles,
                        array('prompt'=>'Seleccione una Empresa')
                        ); 
        
        ?>
        
      <?php echo $form->error($model,'id_empresa'); ?>
        
        
                  
                  
        
    </div>
    <div class="row">
        
         <?php echo $form->labelEx($model,'id_sindicato'); ?>
        
	<?php            $list = Sindicato::model()->findALL(array('condition'=>"cod_convencion=$_GET[convencion]"));
                        $niveles=CHtml::listData($list,'id','nombre');  
                        echo $form->dropDownList($model,'id_sindicato',
                        $niveles,
                        array('prompt'=>'Seleccione un Sindicato')
                        ); 
        
        ?>
        
      <?php echo $form->error($model,'id_sindicato'); ?>
        
        
    </div>
    
   
    
    
    <div class="row">
        <br>
        Formato de Carga de 
       <?php $src= Yii::app()->request->baseUrl;
 $url2 = $src."/archivos/nomina.xls";
 echo"<tr><td style='border:4px solid;border-color: black;text-align: center;'>".
 CHtml::link('Nomina', $url2)." (Recuerde Guardar en Formato CSV al Subir)</td></tr>";
 ?><br>Si tiene dudas con los datos ver:
        <?php
    $this->beginWidget('zii.widgets.jui.CJuiDialog',array(
                        'id'=>'mydialog',
                        // additional javascript options for the dialog plugin
                        'options'=>array(
                            'title'=>'Información',
                            'autoOpen'=>false,
                        ),
                        ));

                        echo 'Nomenclatura para Cargar los Campos de la Forma S:<br><br>
                        <b>Nacionalidad</b>
                        <br>V=Venezolano, E=Extranjero<br><br>
                        <b>Sexo</b>
                        <br>H=Hombre, M=Mujer<br><br>
                        <b>Estado Civil</b><br>
                        S=Soltero, C=Casado, D=Divorciado, V=Viudo<br> <br>
                        <b>Nivel Educativo</b><br>
                        1=No Sabe,  2=Ninguno, 3=Inicial-Preescolar, 4=Primaria-1-6, 5=Secundaria-1-5=, 6=Tecnico superior, 7=Universitario<br> 
                         <br>Nota: Recuerde Subir en formato CSV';

                        $this->endWidget('zii.widgets.jui.CJuiDialog');

                        // the link that may open the dialog
                        echo CHtml::link('Información', '#', array(
                        'onclick'=>'$("#mydialog").dialog("open"); return false;',
                        ));
    
    ?>
    </div> 
    
    
    <div class="row">
        
		<?php echo $form->hiddenField($model,'cod_convencion',array('size'=>60,'maxlength'=>50, 'value'=>$_GET['convencion'])); ?>
               
	
        
        
    </div>
	 
	 <div class="row buttons">
	  <?php echo CHtml::submitButton('Subir',array("id"=>"Import",'name'=>'Import')); ?>
	 </div>
	<?php $this->endWidget(); ?>
    
    

	


</div><!-- form -->