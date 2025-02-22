from Types cimport *
from String cimport *
from FeatureMap cimport *
from MSExperiment cimport *
from FeatureMapping cimport * 
from KDTreeFeatureMaps cimport *
from libcpp.vector cimport vector as libcpp_vector
from libcpp.pair cimport pair as libcpp_pair

cdef extern from "<OpenMS/ANALYSIS/ID/SiriusAdapterAlgorithm.h>" namespace "OpenMS":

    cdef cppclass SiriusAdapterAlgorithm(DefaultParamHandler):

        SiriusAdapterAlgorithm() nogil except +
        SiriusAdapterAlgorithm(SiriusAdapterAlgorithm) nogil except +

        String isFeatureOnly() nogil except +
        Int getFilterByNumMassTraces() nogil except +
        double getPrecursorMzTolerance() nogil except +
        double getPrecursorRtTolerance() nogil except +
        bool precursorMzToleranceUnitIsPPM() nogil except +
        bool isNoMasstraceInfoIsotopePattern() nogil except +
        Int getIsotopePatternIterations() nogil except +
        Int getNumberOfSiriusCandidates() nogil except +
        Int getNumberOfCSIFingerIDCandidates() nogil except +

        String determineSiriusExecutable(String& executable) nogil except +

        void  sortSiriusWorkspacePathsByScanIndex(libcpp_vector[ String ]& subdirs) nogil except +

        void preprocessingSirius(String featureinfo,
                                 MSExperiment& spectra,
                                 libcpp_vector[FeatureMap]& v_fp,
                                 KDTreeFeatureMaps& fp_map_kd,
                                 FeatureMapping_FeatureToMs2Indices& feature_mapping) nogil except +

        void logFeatureSpectraNumber(String& featureinfo,
                                     FeatureMapping_FeatureToMs2Indices& feature_mapping,
                                     MSExperiment& spectra) nogil except +

        libcpp_vector[String] callSiriusQProcess(String tmp_ms_file,
                                                 String tmp_out_dir,
                                                 String executable,
                                                 String out_csifingerid,
                                                 bool decoy_generation) nogil except +

cdef extern from "<OpenMS/ANALYSIS/ID/SiriusAdapterAlgorithm.h>" namespace "OpenMS::SiriusAdapterAlgorithm":
 
    cdef cppclass SiriusTemporaryFileSystemObjects "OpenMS::SiriusAdapterAlgorithm::SiriusTemporaryFileSystemObjects":
        SiriusTemporaryFileSystemObjects(int debug_level)
        SiriusTemporaryFileSystemObjects(SiriusTemporaryFileSystemObjects)
        
        String getTmpDir() nogil except +
        String getTmpOutDir() nogil except +
        String getTmpMsFile() nogil except + 
