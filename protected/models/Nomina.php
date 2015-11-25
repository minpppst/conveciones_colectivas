<?php

/**
 * This is the model class for table "nomina".
 *
 * The followings are the available columns in table 'nomina':
 * @property string $id
 * @property string $nombres
 * @property integer $cedula
 * @property string $nacionalidad
 * @property string $pais_origen
 * @property string $lugar_nacimiento
 * @property string $sexo
 * @property integer $edad
 * @property string $estado_civil
 * @property string $nivel_educativo
 * @property integer $grado_anio_aprobado
 * @property string $oficio_dentro_establecimiento
 * @property integer $codigo_ocupacion
 * @property integer $tiempo_serv_establecimiento_anios
 * @property integer $tiempo_serv_establecimiento_meses
 * @property integer $tiempo_ejerciendo_profesion_anios
 * @property integer $tiempo_ejerciendo_profesion_meses
 * @property string $remuneracion_antes_contra_empleado
 * @property string $remuneracion_antes_contra_obrero
 * @property string $remuneracion_despues_contra_empleado
 * @property string $remuneracion_despues_contra_obrero
 * @property integer $carga_familiar
 * @property string $cod_convencion
 //* @property string $tipo
 *
 * The followings are the available model relations:
 * @property Convencion $codConvencion
 * @property Empresa $id_empresa
 * @property Sindicato $id_sindicato
 */
class Nomina extends CActiveRecord
{
    public $tipo;
    /**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Nomina the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

        
         
        
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'nomina';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
                        array(
                                'csv_file',
                                'file', 'types' => 'csv',
                                'maxSize'=>5242880,
                                'allowEmpty' => true,
                                'wrongType'=>'Only csv allowed.',
                                'tooLarge'=>'File too large! 5MB is the limit'),
                        
			array('nombres,cedula nacionalidad, pais_origen, lugar_nacimiento, sexo, edad, estado_civil, nivel_educativo, grado_anio_aprobado, oficio_dentro_establecimiento, codigo_ocupacion, tiempo_serv_establecimiento_anios, tiempo_serv_establecimiento_meses, tiempo_ejerciendo_profesion_anios, tiempo_ejerciendo_profesion_meses, remuneracion_antes_contra_empleado, remuneracion_antes_contra_obrero, remuneracion_despues_contra_empleado, remuneracion_despues_contra_obrero, carga_familiar, cod_convencion, id_empresa, id_sindicato', 'required'),
			array('edad, grado_anio_aprobado, codigo_ocupacion, tiempo_serv_establecimiento_anios, tiempo_serv_establecimiento_meses, tiempo_ejerciendo_profesion_anios, tiempo_ejerciendo_profesion_meses, carga_familiar', 'numerical', 'integerOnly'=>true),
			array('nombres, pais_origen, lugar_nacimiento', 'length', 'max'=>100),
			array('nacionalidad, sexo, estado_civil', 'length', 'max'=>1),
			array('nivel_educativo', 'length', 'max'=>2),
			array('oficio_dentro_establecimiento', 'length', 'max'=>255),
			array('remuneracion_antes_contra_empleado, remuneracion_antes_contra_obrero, remuneracion_despues_contra_empleado, remuneracion_despues_contra_obrero', 'length', 'max'=>10),
			array('cod_convencion,cedula', 'length', 'max'=>20),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, nombres, cedula, nacionalidad, pais_origen, lugar_nacimiento, sexo, edad, estado_civil, nivel_educativo, grado_anio_aprobado, oficio_dentro_establecimiento, codigo_ocupacion, tiempo_serv_establecimiento_anios, tiempo_serv_establecimiento_meses, tiempo_ejerciendo_profesion_anios, tiempo_ejerciendo_profesion_meses, remuneracion_antes_contra_empleado, remuneracion_antes_contra_obrero, remuneracion_despues_contra_empleado, remuneracion_despues_contra_obrero, carga_familiar, cod_convencion', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'codConvencion' => array(self::BELONGS_TO, 'Convencion', 'cod_convencion'),
                        'id_empresa' => array(self::BELONGS_TO, 'Empresa', 'id'),
                        'id_sindicato' => array(self::BELONGS_TO, 'Sindicato', 'id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'nombres' => 'Nombres',
			'cedula' => 'Cedula de Identidad',
			'nacionalidad' => 'Nacionalidad',
			'pais_origen' => 'Pais Origen',
			'lugar_nacimiento' => 'Lugar Nacimiento',
			'sexo' => 'Sexo',
			'edad' => 'Edad',
			'estado_civil' => 'Estado Civil',
			'nivel_educativo' => 'Nivel Educativo',
			'grado_anio_aprobado' => 'Grado Anio Aprobado',
			'oficio_dentro_establecimiento' => 'Oficio Dentro Establecimiento',
			'codigo_ocupacion' => 'Codigo Ocupacion',
			'tiempo_serv_establecimiento_anios' => 'Tiempo Serv Establecimiento Anios',
			'tiempo_serv_establecimiento_meses' => 'Tiempo Serv Establecimiento Meses',
			'tiempo_ejerciendo_profesion_anios' => 'Tiempo Ejerciciendo Profesion Anios',
			'tiempo_ejerciendo_profesion_meses' => 'Tiempo Ejerciendo Profesion Meses',
			'remuneracion_antes_contra_empleado' => 'Remuneracion Antes Contra Empleado',
			'remuneracion_antes_contra_obrero' => 'Remuneracion Antes Contra Obrero',
			'remuneracion_despues_contra_empleado' => 'Remuneracion Despues Contra Empleado',
			'remuneracion_despues_contra_obrero' => 'Remuneracion Despues Contra Obrero',
			'carga_familiar' => 'Carga Familiar',
                        'csvfile'=>'Subir Archivo CSV',
			'cod_convencion' => 'Cod Convencion',
                        'id_empresa' => 'Codigo Empresa',
                        'id_sindicato' => 'Codigo Sindicato',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('nombres',$this->nombres,true);
		$criteria->compare('cedula',$this->cedula,true);
		$criteria->compare('nacionalidad',$this->nacionalidad,true);
		$criteria->compare('pais_origen',$this->pais_origen,true);
		$criteria->compare('lugar_nacimiento',$this->lugar_nacimiento,true);
		$criteria->compare('sexo',$this->sexo,true);
		$criteria->compare('edad',$this->edad);
		$criteria->compare('estado_civil',$this->estado_civil,true);
		$criteria->compare('nivel_educativo',$this->nivel_educativo,true);
		$criteria->compare('grado_anio_aprobado',$this->grado_anio_aprobado);
		$criteria->compare('oficio_dentro_establecimiento',$this->oficio_dentro_establecimiento,true);
		$criteria->compare('codigo_ocupacion',$this->codigo_ocupacion);
		$criteria->compare('tiempo_serv_establecimiento_anios',$this->tiempo_serv_establecimiento_anios);
		$criteria->compare('tiempo_serv_establecimiento_meses',$this->tiempo_serv_establecimiento_meses);
		$criteria->compare('tiempo_ejerciendo_profesion_anios',$this->tiempo_ejerciendo_profesion_anios);
		$criteria->compare('tiempo_ejerciendo_profesion_meses',$this->tiempo_ejerciendo_profesion_meses);
		$criteria->compare('remuneracion_antes_contra_empleado',$this->remuneracion_antes_contra_empleado,true);
		$criteria->compare('remuneracion_antes_contra_obrero',$this->remuneracion_antes_contra_obrero,true);
		$criteria->compare('remuneracion_despues_contra_empleado',$this->remuneracion_despues_contra_empleado,true);
		$criteria->compare('remuneracion_despues_contra_obrero',$this->remuneracion_despues_contra_obrero,true);
		$criteria->compare('carga_familiar',$this->carga_familiar);
		$criteria->compare('cod_convencion',$this->cod_convencion,true);
                $criteria->compare('id_empresa',$this->id_empresa,true);
                $criteria->compare('id_sindicato',$this->id_sindicato,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
        
        
        	
        public function getUserLevel($id,$posicion,$convencion) {
        
            
           $sql="select id from nomina_tipo_sindicato where id_nomina='".$id."' and cod_convencion_nomina='".$convencion."' and tipo_sindicato='".$posicion."'"; 
            $resultado=Yii::app()->db->createCommand($sql)->execute();
            if ($resultado) {
        return 1;
    }
    return null;
        }
 
            
        
        
        
        
        
        
          public function behaviors()
                {
                    return array(
                        // Classname => path to Class
                        'ActiveRecordLogableBehavior'=>
                            'application.behaviors.ActiveRecordLogableBehavior',
                    );
                }
}